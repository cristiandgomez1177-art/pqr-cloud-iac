resource "aws_api_gateway_rest_api" "pqr_api" {
  name = var.api_name
}

resource "aws_api_gateway_resource" "pqr_resource" {
  rest_api_id = aws_api_gateway_rest_api.pqr_api.id
  parent_id   = aws_api_gateway_rest_api.pqr_api.root_resource_id
  path_part   = "pqr"
}

resource "aws_api_gateway_method" "pqr_method" {
  rest_api_id   = aws_api_gateway_rest_api.pqr_api.id
  resource_id   = aws_api_gateway_resource.pqr_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "pqr_integration" {
  rest_api_id             = aws_api_gateway_rest_api.pqr_api.id
  resource_id             = aws_api_gateway_resource.pqr_resource.id
  http_method             = aws_api_gateway_method.pqr_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_arn
}
