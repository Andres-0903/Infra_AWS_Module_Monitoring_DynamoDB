###Variables

variable "dynamo_tables" {
  description = "Nombre de las tablas"
  type        = map(string)
}

# variable "alarm_name_tables" {
#   description = "Alarma para multiples tablas"
#   type        = string

# }

variable "sns_topic_arn" {
  description = "SNS topic ARN for notifications"
  type        = string
}
# # # variable "dynamodb_success_fulrequest_latency" {
# # #   description = "latencia por peticiones"
# # #   type        = number

# # # }

##Propiedades de la metrica WriteThrottleEvents##
variable "dynamodb_write_throttle_events_evaluation_periods" {
  type    = number
  default = 2 # periodos por cada evaluacion antes de generar la alarma 2 * 60 = 120

}
variable "dynamodb_write_throttle_events_period" {
  type    = number
  default = 60 #Valor en segundos  = 1 minuto

}
variable "dynamodb_write_throttle_events_threshold" {
  type    = number
  default = 0.5 # equivale al 5 % de tasa de error durante los periodos validados

}
##Propiedades de la metrica SystemErrors##
variable "dynamodb_system_errors_evaluation_periods" {
  type    = number
  default = 3 # periodos por cada evaluacion antes de generar la alarma 3 * 60 = 180
}
variable "dynamodb_system_errors_period" {
  type    = number
  default = 60 #Valor en segundos  = 1 minuto  
}
variable "dynamodb_system_errors_threshold" { ## Pendiente continuar -------
  type    = number
  default = 3 #valor cantidad de errores durante el tiempo evaluado   
}
##Propiedades de la metrica SuccessfulRequestLatency##
variable "dynamodb_success_fulrequest_latency_periods" {
  type    = number
  default = 2 # periodos por cada evaluacion antes de generar la alarma 2 * 60 = 120
}
variable "dynamodb_success_fulrequest_latency_period" {
  type    = number
  default = 60 #Valor en segundos  = 1 minuto  
}
variable "SuccessfulRequestLatency_threshold" {
  type    = number
  default = 10000 #valor en milisegunds = 10 segundos  
}
##Propiedades de la metrica ReturnedBytes##
variable "dynamodb_returned_bytes_periods" {
  type    = number
  default = 2 # periodos por cada evaluacion antes de generar la alarma 2 * 60 = 120
}
variable "dynamodb_returned_bytes_period" {
  type    = number
  default = 60 #Valor en segundos  = 1 minuto
}
variable "ReturnedBytes_threshold" {
  type    = number
  default = 500000 #Valor en bytes  = 50 KB
}

#######
#TAGS 
#######

variable "project" {
  type = string
}


variable "name_service" {
  type = string
}

variable "purpose" {
  type = string
}

variable "bdo-environment" {
  type = string
}

variable "resource_aditional_tags" {
  type        = map(string)
  description = "TTags adicionales no obligatorias"
  default     = {}

}

variable "resource_tags" {
  type        = map(string)
  description = "Tags BdO -Tags Aval"
  default     = {}

}
