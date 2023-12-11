terraform {
  required_providers {
    aiven = {
      source  = "aiven/aiven"
      version = "4.9.3"
    }
  }
}

resource "aiven_static_ip" "pg1" {
  project    = var.project
  cloud_name = var.cloud_name
}

resource "aiven_static_ip" "pg2" {
  project    = var.project
  cloud_name = var.cloud_name
}

resource "aiven_pg" "pg" {
  project                 = var.project
  cloud_name              = var.cloud_name
  plan                    = var.plan
  service_name            = var.service_name
  maintenance_window_dow  = "monday"
  maintenance_window_time = "10:00:00"

  static_ips = toset([
    aiven_static_ip.pg1.static_ip_address_id,
    aiven_static_ip.pg2.static_ip_address_id
  ])

  pg_user_config {
    pg_version = 15
    static_ips = true

    public_access {
      pg         = true
      prometheus = false
    }

    pg {
      idle_in_transaction_session_timeout = 900
      log_min_duration_statement          = -1
    }
  }

  timeouts {
    create = "20m"
    update = "15m"
  }
}

resource "aiven_pg_database" "mydatabase" {
  project       = var.project 
  service_name  = aiven_pg.pg.service_name
  database_name = var.db_name
}
