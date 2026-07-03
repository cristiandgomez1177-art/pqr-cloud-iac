resource "aws_sqs_queue" "pqr_queue" {
  name = var.queue_name
}

output "queue_url" {
  value = aws_sqs_queue.pqr_queue.id
}
