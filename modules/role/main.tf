terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
}

resource "snowflake_role" "role" {
  name = var.name

  lifecycle {
    ignore_changes = all
  }
}

resource "snowflake_role_grants" "database_grant" {
  role_name     = snowflake_role.role.name
  database_name = var.database_name
  privilege     = var.database_privilege

  lifecycle {
    ignore_changes = all
  }
}

resource "snowflake_role_grants" "warehouse_grant" {
  role_name      = snowflake_role.role.name
  warehouse_name = var.warehouse_name
  privilege      = var.warehouse_privilege

  lifecycle {
    ignore_changes = all
  }
}

output "role_name" {
  value = snowflake_role.role.name
}
