variable "name" {
  type        = string
  description = "Name of the role"
  default     = "EXT_SALESFORCE_USAGE"
}

variable "database_name" {
  type        = string
  description = "Name of the database to grant access"
  default     = "EXT_SALESFORCE_DB"
}

variable "warehouse_name" {
  type        = string
  description = "Name of the warehouse to grant access"
  default     = "EXT_SALESFORCE_WH"
}

variable "database_privilege" {
  type        = string
  description = "Privilege for the database"
  default     = "USAGE"
}

variable "warehouse_privilege" {
  type        = string
  description = "Privilege for the warehouse"
  default     = "USAGE"
}

variable "snowflake_role" {
  type        = string
  description = "Role used for deployment"
  sensitive   = true
}
