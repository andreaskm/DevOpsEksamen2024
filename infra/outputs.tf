output "sqs_queue_url" {
  value = aws_sqs_queue.image_generation_queue.id
}