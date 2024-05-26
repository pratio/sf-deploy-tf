resource "snowflake_warehouse" "warehouse" {
  name           = var.name
  warehouse_size = var.size
  auto_suspend   = var.auto_suspend
}

output "warehouse_name" {
  value = snowflake_warehouse.warehouse.name
}
