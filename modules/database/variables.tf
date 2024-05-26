variable "name" {
  type        = string
  description = "Name of the database"
}

variable "schemas" {
  type        = list(string)
  description = "List of schemas"
}
