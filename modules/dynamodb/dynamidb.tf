resource "aws_dynamodb_table" "pqr_table" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "idPqr"

  attribute {
    name = "idPqr"
    type = "S"
  }
}

output "table_name" {
  value = aws_dynamodb_table.pqr_table.name
}
