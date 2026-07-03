variable "region" {
  type    = string
  default = "us-east-1"
}

variable "dynamodb_table_name" {
  type    = string
  default = "PQRTable"
}

variable "lambda_function_name" {
  type    = string
  default = "PQRHandler"
}

variable "api_name" {
  type    = string
  default = "PQRApi"
}

variable "s3_bucket_name" {
  type    = string
  default = "pqr-attachments"
}

variable "sqs_queue_name" {
  type    = string
  default = "PQRQueue"
}
