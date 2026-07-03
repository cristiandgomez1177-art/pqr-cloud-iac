resource "aws_sqs_queue" "pqr_queue" {
  name = var.queue_name
}
