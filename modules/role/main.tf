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

resource "snowflake_role_grants" "role_grants" {
  role_name = snowflake_role.role.name

  for_each = toset([
    "USAGE on DATABASE ${var.database_name}",
    "USAGE on WAREHOUSE ${var.warehouse_name}",
  ])

  privilege = split(" ", each.key)[0]
  on = join(" ", slice(split(" ", each.key), 2, length(split(" ", each.key))))

  lifecycle {
    ignore_changes = all
  }
}

output "role_name" {
  value = snowflake_role.role.name
}
