terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
  backend "s3" {}
}

provider "snowflake" {
  role = var.snowflake_role
}

module "sales" {
  source = "../../systems/sales"
}


