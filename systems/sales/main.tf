terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
}

module "sales_database" {
  source  = "../../modules/database"
  name    = var.database_name
  schemas = ["schema1", "schema2"]
}

module "sales_warehouse" {
  source       = "../../modules/warehouse"
  name         = var.warehouse_name
  size         = "X-Small"
  auto_suspend = 60
}

module "sales_role" {
  source             = "../../modules/role"
  name               = var.name
  database_name      = module.sales_database.database_name
  database_privilege = var.database_privilege
  warehouse_name     = module.sales_warehouse.warehouse_name
  warehouse_privilege = var.warehouse_privilege
}
