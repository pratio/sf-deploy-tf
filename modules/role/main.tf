resource "snowflake_role" "role" {
  name = var.name
}

resource "snowflake_role_grants" "role_grants" {
  role_name = snowflake_role.role.name
  database_privileges {
    database_name = var.database_name
    privilege     = var.database_privilege
  }
  warehouse_privileges {
    warehouse_name = var.warehouse_name
    privilege      = var.warehouse_privilege
  }
}

output "role_name" {
  value = snowflake_role.role.name
}
