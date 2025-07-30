# output "dynamodb_write_throttle_events" {
#   value = [for key, _ in var.dynamo_tables : aws_cloudwatch_metric_alarm.dynamodb_write_throttle_events[key].alarm_name]
# }

# output "dynamodb_system_errors" {
#   value = [for key, _ in var.dynamo_tables : aws_cloudwatch_metric_alarm.dynamodb_system_errors[key].alarm_name]
# }

# output "dynamodb_returned_bytes" {
#   value = [for key, _ in var.dynamo_tables : aws_cloudwatch_metric_alarm.dynamodb_returned_bytes[keys].alarm_name]
# }

# output "dynamodb_success_fulrequest_latency" {
#   value = [for key, _ in var.dynamo_tables : aws_cloudwatch_metric_alarm.dynamodb_success_fulrequest_latency[key].alarm_name]
# }

