##########
#Local
##########

locals {
  common_tags = {
    bdo-name-app             = var.project
    bdo-name-service         = "alarma"
    map-migrated             = var.tag_map_migrated
    bdo-business-area        = var.tag_business_area
    bdo-business-domain      = var.tag_business_domain
    bdo-environment          = var.tag_environment
    bdo-organizational-units = var.tag_organizational_units
    bdo-service-domain       = var.tag_service_domain
    bdo-cost                 = var.tag_cost
    bdo-app-code             = var.tag_code_app
  }

  common_dimensions = {
    TableName = "AllTables"
  }

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]
}
