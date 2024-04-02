variable "sonarqube_config" {
  type = any
  default = {
    hostname                       = ""
    values_yaml                    = ""
    storage_class_name             = ""
    sonarqube_volume_size          = ""
    postgresql_volume_size         = ""
    grafana_monitoring_enabled     = false
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
  }
  description = "Specify the configuration settings for Sonarqube, including the hostname, storage options, and custom YAML values."
}

variable "helm_chart_version" {
  type        = string
  default     = "10.4.1"
  description = "Version of the Sonarqube chart that will be used to deploy Sonarqube application."
}

variable "namespace" {
  type        = string
  default     = "sonarqube"
  description = "Name of the Kubernetes namespace where Sonarqube will be deployed."
}

variable "sonarqube_password_length" {
  type        = number
  default     = 20
  description = "Length of the password for sonarqube"
}

variable "postgresql_password_length" {
  type        = number
  default     = 20
  description = "Length of the password for postgresql"
}
