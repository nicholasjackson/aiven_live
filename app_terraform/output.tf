output "ip_addresses" {
  value = [aiven_static_ip.pg1.ip_address,aiven_static_ip.pg2.ip_address]
}

output "username" {
  value = aiven_pg.pg.service_username
}

output "password" {
  value = aiven_pg.pg.service_password
  sensitive = true
}