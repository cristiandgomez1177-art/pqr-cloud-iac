resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = { Service = "lambda.amazonaws.com" },
      Effect = "Allow"
    }]
  })
}

resource "aws_lambda_function" "pqr_handler" {
  function_name = var.function_name
  runtime       = "python3.11"
  handler       = "handler.lambda_handler"
  role          = aws_iam_role.lambda_exec.arn
  filename      = "../pqr-lambda/build/pqr_handler.zip"
}

output "function_name" {
  value = aws_lambda_function.pqr_handler.function_name
}

output "lambda_arn" {
  value = aws_lambda_function.pqr_handler.arn
}
