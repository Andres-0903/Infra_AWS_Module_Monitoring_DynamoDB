##########
#Local
##########

locals {

  common_dimensions = {
    TableName = "AllTables"
  }

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]
}
