variable "name" {
  type        = string
  description = "Name of the role"
}

variable "database_name" {
  type        = string
  description = "Name of the database to grant access"
}

variable "database_privilege" {
  type        = string
  description = "Privilege for the database"
}

variable "warehouse_name" {
  type        = string
  description = "Name of the warehouse to grant access"
}

variable "warehouse_privilege" {
  type        = string
  description = "Privilege for the warehouse"
}
