resource "snowflake_database" "database" {
  name = var.name

  lifecycle {
    ignore_changes = all
  }
}

resource "snowflake_schema" "schema" {
  count       = length(var.schemas)
  name        = var.schemas[count.index]
  database    = snowflake_database.database.name

  lifecycle {
    ignore_changes = all
  }
}

output "database_name" {
  value = snowflake_database.database.name
}
