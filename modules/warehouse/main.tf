resource "snowflake_warehouse" "warehouse" {
  name                                = var.name
  warehouse_size                      = var.size
  auto_suspend                        = var.auto_suspend
  max_concurrency_level               = 8
  warehouse_type                      = "STANDARD"
  enable_query_acceleration           = false
  statement_queued_timeout_in_seconds = 0
  statement_timeout_in_seconds        = 172800

  lifecycle {
    ignore_changes = all
  }
}

output "warehouse_name" {
  value = snowflake_warehouse.warehouse.name
}
