terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
}


module "sales_database" {
  source = "../../modules/database"
  name   = "EXT_SALESFORCE_DB"
  schemas = ["schema1", "schema2"]
}

module "sales_warehouse" {
  source      = "../../modules/warehouse"
  name        = "EXT_SALESFORCE_WH"
  size        = "X-Small"
  auto_suspend = 60
}

module "sales_role" {
  source             = "../../modules/role"
  name               = "EXT_SALESFORCE_USAGE"
  database_name      = module.sales_database.database_name
  database_privilege = "USAGE"
  warehouse_name     = module.sales_warehouse.warehouse_name
  warehouse_privilege = "USAGE"
}
