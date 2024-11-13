variable "bucket_name" {
  description = "S3 Bucket for storing generated images"
  type        = string
  default = "pgr301-couch-explorers"
}

variable "sqs_queue_name" {
  description = "Name of the SQS queue for image generation"
  type = string
  default = "image-generation-queue-12"
}