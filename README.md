Módulo de Monitoreo para DynamoDB en AWS

Este módulo Terraform permite configurar alertas de monitoreo en Amazon CloudWatch para buckets DynamoDB. Estas alertas están diseñadas para supervisar las Solicitudes a DynamoDB, así como las solicitudes con códigos de estado de errores, latencia y Bytes devueltos. Estas alertas facilitan la detección temprana de posibles problemas y la toma de acciones preventivas.

The current version includes the following resources:

(main.tf file): Este archivo contiene la configuración principal del módulo. Aquí se definen los recursos específicos de CloudWatch que se están implementando, como alarmas, paneles de control.

(locals.tf file): En este archivo, contiene las variables locales para simplificar la configuración. Estas variables locales son útiles para evitar la repetición de expresiones complejas y mejorar la legibilidad del código.

(output.tf file):Aquí se especifican las salidas que el módulo proporcionará una vez que se haya aplicado.

(variables.tf file): En este archivo se definen las variables que permiten la personalización del módulo. Incluye variables como nombres de recursos, umbrales de alarmas, entre otras. El uso de variables facilita la reutilización del módulo en diferentes contextos con diferentes configuraciones.

Requirements
Name Version
terraform >= 1.0
aws ~> 5.0

Providers
Name Version
hashicorp/aws ~> 5.0
hashicorp/random ~> 3.4.3

resource:
https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/metrics-dimensions.html

Configuración Detallada

Eventos de WriteThrottle en las tablas DynamoDB
Alerta configurada para monitorear si las solicitudes a DynamoDB exceden las unidades de capacidad de escritura aprovisionadas

resource "aws_cloudwatch_metric_alarm" "dynamodb_write_throttle_events" {

# ... (ver detalles en el código proporcionado)

}

Alertas para SystemErrors

resource "aws_cloudwatch_metric_alarm" "dynamodb_system_errors" {

# ... (ver detalles en el código proporcionado)

}

Alertas para SuccessfulRequestLatency

resource "aws_cloudwatch_metric_alarm" "dynamodb_success_fulrequest_latency" {

# ... (ver detalles en el código proporcionado)

}

Alertas para ReturnedBytes

resource "aws_cloudwatch_metric_alarm" "dynamodb_returned_bytes" {

# ... (ver detalles en el código proporcionado)

}

Parámetros Configurables
dynamo_tables: Mapa que contiene información sobre las tablas de dynamo a monitorear.

var.service: Nombre del servicio asociado a las alertas.

alarm_name: El parámetro alarm_name se utiliza para establecer el nombre de la alarma en CloudWatch.

comparison_operator:

El parámetro comparison_operator define la operación de comparación que se utilizará para evaluar si la métrica supera el umbral establecido. En el ejemplo proporcionado, se utiliza la opción "GreaterThanOrEqualToThreshold", que significa "mayor o igual que el umbral". Esto implica que la alerta se activará si el valor de la métrica es igual o mayor que el umbral especificado.

Ejemplo en el código:

comparison_operator = "GreaterThanOrEqualToThreshold"

Otras opciones comunes para comparison_operator incluyen:

"GreaterThanOrEqualToThreshold": Activa la alerta si la métrica es mayor o igual al umbral.
"GreaterThanThreshold": Activa la alerta si la métrica es estrictamente mayor que el umbral.
"LessThanOrEqualToThreshold": Activa la alerta si la métrica es menor o igual al umbral.
"LessThanThreshold": Activa la alerta si la métrica es estrictamente menor que el umbral.
La elección del operador dependerá de la métrica que estás monitoreando y de cuándo deseas activar la alerta según los valores de la métrica.

Ejemplo de configuración con otro operador:

comparison_operator = "LessThanThreshold"

Esto activaría la alerta si la métrica es estrictamente menor que el umbral especificado.

Asegúrate de seleccionar el operador que tenga sentido para el contexto de la métrica específica y los requisitos de tu aplicación.

evaluation_periods: Este parámetro representa la cantidad de períodos de evaluación consecutivos en los que la métrica debe superar el umbral para que se active la alerta. En otras palabras, es el número de veces consecutivas que la condición de la alarma debe cumplirse antes de que se dispare la alerta. Este valor ayuda a reducir falsos positivos y garantiza que el problema persista durante un período de tiempo definido antes de activar la alerta.

metric_name: se utiliza para especificar el nombre de la métrica que se está monitoreando

namespace: se utiliza para especificar el espacio de nombres (namespace) al que pertenece la métrica que estás monitoreando.

period: establece la frecuencia con la que CloudWatch recopila datos para la métrica antes de evaluar si la alerta debe activarse. Es el intervalo de tiempo entre dos puntos de datos consecutivos. Por ejemplo, si period está configurado en 300 segundos, la métrica se evaluará cada 5 minutos.

statistic: se utiliza para especificar la estadística que CloudWatch utilizará al evaluar la métrica durante el período de evaluación. Las estadísticas son cálculos matemáticos aplicados a los datos recopilados de la métrica en un periodo específico. Las opciones comunes para el parámetro statistic incluyen:

"SampleCount": Número de muestras en el periodo.

"Average": Promedio de todos los puntos de datos en el periodo.

"Sum": Suma de todos los puntos de datos en el periodo.

"Minimum": Valor mínimo de todos los puntos de datos en el periodo.

"Maximum": Valor máximo de todos los puntos de datos en el periodo.

En el ejemplo proporcionado:

statistic = "Average"

El statistic está establecido en "Average", lo que significa que la alarma utilizará el promedio de los valores de la métrica durante el período de evaluación para decidir si activar la alerta.

La elección de la estadística depende de la métrica que estás monitoreando y de cómo deseas interpretar los datos. Por ejemplo, si estás monitoreando el uso de CPU, es posible que estés interesado en el promedio para obtener una visión general del rendimiento. Si estás monitoreando la latencia, podrías estar más interesado en el valor máximo.

threshold: El parámetro threshold establece el valor límite que debe alcanzar o superar la métrica para activar la alerta. Por ejemplo, si estás monitoreando el espacio libre en disco y estableces threshold en 80%, la alerta se activará cuando el espacio libre en disco sea igual o inferior al 80%.

Tags
Configurados en base a los lineamientos del banco.

var.tag_environment: Etiqueta que identifica el entorno.
var.tag_app, var.tag_business_area, var.tag_business_domain, etc.: Etiquetas para clasificar y organizar recursos.
dimensions: se utiliza para proporcionar información adicional que permite especificar a qué recurso o conjunto de recursos se aplica la alarma. En AWS CloudWatch, las dimensiones son pares clave-valor que ayudan a identificar y distinguir entre diferentes instancias de una métrica.
La línea en cuestión:

dimensions = merge(local.common_dimensions, { TableName = each.value })
