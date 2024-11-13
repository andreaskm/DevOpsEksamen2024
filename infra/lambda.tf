resource "aws_lambda_function" "image_lambda" {
  function_name = "ImageGenerationLambda-12"
  handler       = "lambda_sqs.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_execution_role.arn
  timeout       = 30

  filename      = "lambda_sqs.zip"

  environment {
    variables = {
      BUCKET_NAME = var.bucket_name
    }
  }
}

resource "aws_lambda_event_source_mapping" "lambda_sqs_trigger" {
  event_source_arn = aws_sqs_queue.image_generation_queue.arn
  function_name    = aws_lambda_function.image_lambda.arn
  batch_size       = 10
  enabled          = true
}