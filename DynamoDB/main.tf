
## Total unidades de capacidad de escritura aprovisionadas  para una tabla
resource "aws_cloudwatch_metric_alarm" "dynamodb_write_throttle_events" {

  for_each            = var.dynamo_tables
  alarm_name          = "${var.project}-${var.name_service}-WriteThrottleEvents-${each.key}-${var.bdo-environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.dynamodb_write_throttle_events_evaluation_periods
  metric_name         = "WriteThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = var.dynamodb_write_throttle_events_period
  statistic           = "Average"
  threshold           = var.dynamodb_write_throttle_events_threshold
  alarm_description   = "Eventos de WriteThrottle en las tablas DynamoDB"

  tags = merge({
    name = "${var.project}-${var.name_service}-${var.purpose}-${var.bdo-environment}"
    },
    var.resource_aditional_tags != null ? var.resource_aditional_tags : {},
    var.resource_tags
  )

  dimensions = merge(local.common_dimensions, { TableName = each.value })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions
}

## Total errores
resource "aws_cloudwatch_metric_alarm" "dynamodb_system_errors" {

  for_each            = var.dynamo_tables
  alarm_name          = "${var.project}-${var.name_service}-SystemErrors-${each.key}-${var.bdo-environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.dynamodb_system_errors_evaluation_periods
  metric_name         = "SystemErrors"
  namespace           = "AWS/DynamoDB"
  period              = var.dynamodb_system_errors_period
  statistic           = "Average"
  threshold           = var.dynamodb_system_errors_threshold
  alarm_description   = "Total de Errores en las tablas DynamoDB"

  tags = merge({
    name = "${var.project}-${var.name_service}-${var.purpose}-${var.bdo-environment}"
    },
    var.resource_aditional_tags != null ? var.resource_aditional_tags : {},
    var.resource_tags
  )

  dimensions = merge(local.common_dimensions, { TableName = each.value })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

}

## Latencia # solicitudes  correctas a DynamoDB
resource "aws_cloudwatch_metric_alarm" "dynamodb_success_fulrequest_latency" {

  for_each            = var.dynamo_tables
  alarm_name          = "${var.project}-${var.name_service}-SuccessfulRequestLatency-${each.key}-${var.bdo-environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.dynamodb_success_fulrequest_latency_periods
  metric_name         = "SuccessfulRequestLatency"
  namespace           = "AWS/DynamoDB"
  period              = var.dynamodb_success_fulrequest_latency_period
  statistic           = "Average"
  threshold           = var.SuccessfulRequestLatency_threshold
  alarm_description   = "Total latencia por peticion hacia la tabla"

  tags = merge({
    name = "${var.project}-${var.name_service}-${var.purpose}-${var.bdo-environment}"
    },
    var.resource_aditional_tags != null ? var.resource_aditional_tags : {},
    var.resource_tags
  )

  dimensions = merge(local.common_dimensions, { TableName = each.value })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

}

## El número de bytes devueltos por las operaciones GetRecords
resource "aws_cloudwatch_metric_alarm" "dynamodb_returned_bytes" {

  for_each            = var.dynamo_tables
  alarm_name          = "${var.project}-${var.name_service}-ReturnedBytes-${each.key}-${var.bdo-environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.dynamodb_returned_bytes_periods
  metric_name         = "SuccessfulRequestLatency"
  namespace           = "AWS/DynamoDB"
  period              = var.dynamodb_returned_bytes_period
  statistic           = "Average"
  threshold           = var.ReturnedBytes_threshold
  alarm_description   = "Bytes devueltos por las operaciones de la tabla"

  tags = merge({
    name = "${var.project}-${var.name_service}-${var.purpose}-${var.bdo-environment}"
    },
    var.resource_aditional_tags != null ? var.resource_aditional_tags : {},
    var.resource_tags
  )

  dimensions = merge(local.common_dimensions, { TableName = each.value })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

}
