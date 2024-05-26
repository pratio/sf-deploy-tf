terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
}

resource "snowflake_database" "database" {
  name = var.name

  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }

  provisioner "local-exec" {
    command = "echo Database ${self.name} already exists."
    when    = create
    on_failure = continue
  }
}

output "database_name" {
  value = snowflake_database.database.name
}
