
## Total unidades de capacidad de escritura aprovisionadas  para una tabla
resource "aws_cloudwatch_metric_alarm" "dynamodb_write_throttle_events" {

  for_each            = var.dynamo_tables
  alarm_name          = "${var.alarm_name_tables}-${each-key}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.dynamodb_write_throttle_events_evaluation_periods
  metric_name         = "WriteThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = var.dynamodb_write_throttle_events.period
  statistic           = "Average"
  threshold           = var.dynamodb_write_throttle_events.threshold
  alarm_description   = "Eventos de WriteThrottle en las tablas DynamoDB"

  tags = local.common_tags

  dimensions = merge(local.common_dimensions, { TableName = each.value })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions
}

## Total errores
resource "aws_cloudwatch_metric_alarm" "dynamodb_system_errors" {

  for_each            = var.dynamo_tables
  alarm_name          = "${var.project}-${var.service}-SystemErrors-${each.key}-${var.tag_environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.dynamodb_write_throttle_events_evaluation_periods
  metric_name         = "SystemErrors"
  namespace           = "AWS/DynamoDB"
  period              = var.dynamodb_system_errors.period
  statistic           = "Average"
  threshold           = var.dynamodb_system_errors.threshold
  alarm_description   = "Total de Errores en las tablas DynamoDB"

  tags = local.common_tags

  dimensions = merge(local.common_dimensions, { TableName = each.value })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

}

## Latencia # solicitudes  correctas a DynamoDB
resource "aws_cloudwatch_metric_alarm" "dynamodb_success_fulrequest_latency" {

  for_each            = var.dynamo_tables
  alarm_name          = "${var.project}-${var.service}-SuccessfulRequestLatency-${each-key}-${var.tag_environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.dynamodb_success_fulrequest_latency.periods
  metric_name         = "SuccessfulRequestLatency"
  namespace           = "AWS/DynamoDB"
  period              = var.dynamodb_success_fulrequest_latency.period
  threshold           = var.SuccessfulRequestLatency.threshold
  alarm_description   = "Total latencia por peticion hacia la tabla"

  tags = local.common_tags

  dimensions = merge(local.common_dimensions, { TableName = each.value })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

}

## El número de bytes devueltos por las operaciones GetRecords
resource "aws_cloudwatch_metric_alarm" "dynamodb_returned_bytes" {

  for_each            = var.dynamo_tables
  alarm_name          = "${var.project}-${var.service}-ReturnedBytes-${each-key}-${var.tag_environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.dynamodb_returned_bytes.periods
  metric_name         = "SuccessfulRequestLatency"
  namespace           = "AWS/DynamoDB"
  period              = var.dynamodb_returned_bytes.period
  threshold           = var.ReturnedBytes.threshold
  alarm_description   = "Bytes devueltos por las operaciones de la tabla"

  tags = local.common_tags

  dimensions = merge(local.common_dimensions, { TableName = each.value })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

}
