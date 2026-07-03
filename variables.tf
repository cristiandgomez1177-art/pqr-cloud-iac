variable "region" {
  default = "us-east-1"
}

variable "dynamodb_table_name" {
  default = "PQRTable"
}

variable "lambda_function_name" {
  default = "pqrHandler"
}

variable "api_name" {
  default = "PQRApi"
}

variable "s3_bucket_name" {
  default = "pqr-attachments"
}

variable "sqs_queue_name" {
  default = "PQRQueue"
}
