resource "aws_cloudwatch_metric_alarm" "age_of_oldest_message_alarm" {
  alarm_name          = "${var.prefix}-age_of_oldest_message_alarm"
  namespace = var.prefix
  metric_name = "ApproximateAgeOfOldestMessage"

  comparison_operator = "GreaterThanThreshold"
  threshold = var.threshold
  evaluation_periods  = 1
  period = "60"
  statistic = "Maximum"

  alarm_description = "This alarm triggers when the approximate age of the oldest message in the queue exceeds the threshold"

}

resource "aws_sns_topic" "user_updates" {
  name = "${var.prefix}-alarm-topic"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}