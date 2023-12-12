variable "project" {
  description = "The Aiven project to create the database in"
}

variable "cloud_name" {
  description = "The cloud to provision the database to"
}

variable "service_name" {
  description = "The name of the service"
}

variable "plan" {
  description = "The plan to use when provisioning the database"
}

variable "db_name" {
  description = "The name of the database"
}