provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = var.region
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  endpoints {
    apigateway = "http://localhost:4566"
    dynamodb   = "http://localhost:4566"
    lambda     = "http://localhost:4566"
    s3         = "http://localhost:4566"
    sqs        = "http://localhost:4566"
    iam        = "http://localhost:4566"
    sts        = "http://localhost:4566"
  }
}

# DynamoDB
module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = var.dynamodb_table_name
}

# Lambda
module "lambda" {
  source        = "./modules/lambda"
  function_name = var.lambda_function_name
}

# API Gateway
module "apigateway" {
  source     = "./modules/apigateway"
  api_name   = var.api_name
  lambda_arn = module.lambda.lambda_arn
}

# S3
module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
}

# SQS
module "sqs" {
  source     = "./modules/sqs"
  queue_name = var.sqs_queue_name
}
