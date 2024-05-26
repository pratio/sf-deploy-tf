resource "snowflake_database" "database" {
  name = var.name
}

resource "snowflake_schema" "schema" {
  count       = length(var.schemas)
  name        = var.schemas[count.index]
  database    = snowflake_database.database.name
}

output "database_name" {
  value = snowflake_database.database.name
}
