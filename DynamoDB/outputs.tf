output "aws_cloudwatch_metric_alarm.dynamodb_write_throttle_events_alarm_names" {
  value = [for key, _ in var.dynamo_tables : aws_cloudwatch_metric_alarm.dynamodb_write_throttle_events[key].alarm_name]
}

output "dynamodb_write_throttle_events_alarm_arns" {
  value = [for key, _ in var.dynamo_tables : aws_cloudwatch_metric_alarm.dynamodb_write_throttle_events[table].arn]
}

