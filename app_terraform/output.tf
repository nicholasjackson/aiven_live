output "ip_addresses" {
  value = [aiven_static_ip.pg1.ip_address,aiven_static_ip.pg2.ip_address]
}

output "db_host" {
  value = aiven_pg.pg.service_host
}

output "db_port" {
  value = aiven_pg.pg.service_port
}

output "db_username" {
  value = aiven_pg.pg.service_username
}

output "db_password" {
  value = aiven_pg.pg.service_password
  sensitive = true
}

output "db_database" {
  value = aiven_pg_database.mydatabase.database_name
}