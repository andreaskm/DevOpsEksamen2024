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

variable "threshold" {
  default = "300" # Five minutes should not give us any bad reviews on the app store
  type = string
}

variable "alarm_email" {
  default = "andreas.km12@gmail.com"
  type = string
}

variable "prefix" {
  default = "kn-12"
  type = string
}