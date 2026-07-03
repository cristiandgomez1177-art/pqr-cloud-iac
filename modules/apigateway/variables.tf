variable "api_name" {
  type        = string
  description = "Nombre del API Gateway"
}

variable "lambda_arn" {
  type        = string
  description = "ARN de la Lambda para integración"
}
