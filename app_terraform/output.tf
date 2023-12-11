output "ip_addresses" {
  value = [aiven_static_ip.pg1.ip_addresses,aiven_static_ip.pg2.ip_addresses]
}

output "username" {
  value = aiven_pg.pg.service_username
}

output "password" {
  value = aiven_pg.pg.service_password
}