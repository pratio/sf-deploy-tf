terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
}


resource "snowflake_warehouse" "warehouse" {
  name                        = var.name
  warehouse_size              = var.size
  auto_suspend                = var.auto_suspend
  max_concurrency_level       = 8
  warehouse_type              = "STANDARD"
  enable_query_acceleration   = false
  statement_queued_timeout_in_seconds = 0
  statement_timeout_in_seconds        = 172800

  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }

  provisioner "local-exec" {
    command = "echo Warehouse ${self.name} already exists."
    when    = create
    on_failure = continue
  }
}

output "warehouse_name" {
  value = snowflake_warehouse.warehouse.name
}
