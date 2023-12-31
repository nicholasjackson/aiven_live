variable "project" {
  default = "hc-demo"
  description = "The Aiven project to create the database in"
}

variable "cloud_name" {
  default = "google-europe-west1"
  description = "The cloud to provision the database to"
}

variable "service_name" {
  default = "pgdb-1"
  description = "The name of the service"
}

variable "plan" {
  default = "startup-8"
  description = "The plan to use when provisioning the database"
}

variable "db_name" {
  default = "mydb"
  description = "The name of the database"
}