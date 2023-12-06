terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
  backend "s3" {

  }
}
provider "snowflake" {
  role = var.snowflake_role
}

resource "snowflake_database" "db" {
  name = "SF-DEPLOY-TF"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "SF-DEPLOY-TF"
  warehouse_size = "X-Small"
  auto_suspend   = 60

}
