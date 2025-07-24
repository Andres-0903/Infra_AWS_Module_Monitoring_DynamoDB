# 📊 Módulo de Monitoreo para DynamoDB en AWS

Este módulo de **Terraform** permite configurar **alertas de monitoreo** en **Amazon CloudWatch** para tablas DynamoDB. Las alertas supervisan solicitudes, errores, latencia y bytes devueltos, permitiendo detección temprana de problemas y acción preventiva.

---

## ✅ Requisitos

| Herramienta | Versión mínima |
|-------------|----------------|
| Terraform   | >= 1.0         |
| AWS Provider | ~> 5.0        |
| Random Provider | ~> 3.4.3   |

---

## 📁 Archivos principales

- **`main.tf`**: Configuración de recursos de CloudWatch (alarmas, dashboards).
- **`locals.tf`**: Variables locales para simplificar la configuración.
- **`output.tf`**: Variables de salida del módulo.
- **`variables.tf`**: Variables para personalización (nombres, umbrales, etc).

---

## 🔧 Configuración detallada

### Alarmas configuradas:

- **WriteThrottleEvents** – Monitorea si se excede la capacidad de escritura:
```hcl
resource "aws_cloudwatch_metric_alarm" "dynamodb_write_throttle_events" {
  ...
}
```

- **SystemErrors** – Errores internos en las solicitudes:
```hcl
resource "aws_cloudwatch_metric_alarm" "dynamodb_system_errors" {
  ...
}
```

- **SuccessfulRequestLatency** – Latencia de solicitudes exitosas:
```hcl
resource "aws_cloudwatch_metric_alarm" "dynamodb_success_fulrequest_latency" {
  ...
}
```

- **ReturnedBytes** – Tamaño de respuesta:
```hcl
resource "aws_cloudwatch_metric_alarm" "dynamodb_returned_bytes" {
  ...
}
```

Referencia: [AWS DynamoDB Metrics](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/metrics-dimensions.html)

---

## ⚙️ Parámetros configurables

| Parámetro                | Descripción |
|--------------------------|-------------|
| `dynamo_tables`          | Mapa de tablas Dynamo a monitorear. |
| `var.service`            | Nombre del servicio. |
| `alarm_name`             | Nombre de la alarma. |
| `comparison_operator`    | Operador de comparación (e.g., `GreaterThanThreshold`). |
| `evaluation_periods`     | Cantidad de períodos de evaluación antes de activar. |
| `metric_name`            | Nombre de la métrica monitoreada. |
| `namespace`              | Espacio de nombres de la métrica. |
| `period`                 | Frecuencia de evaluación en segundos. |
| `statistic`              | Estadística usada (`Average`, `Sum`, etc). |
| `threshold`              | Valor límite para activar la alerta. |
| `dimensions`             | Dimensiones específicas de la métrica. |
| `tags`                   | Etiquetas del banco: `tag_environment`, `tag_app`, etc. |

---

## 🧪 Ejemplo de uso

```hcl
module "dynamo_monitoring" {
  source             = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_DynamoDB.git"
  dynamo_tables      = var.dynamo_tables
  service            = "mi-servicio"
  tag_environment    = "prod"
  tag_app            = "mi-app"
  ...
}
```

---

## 🤝 Contribuir


---

## 📝 Resource

https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/metrics-dimensions.html


