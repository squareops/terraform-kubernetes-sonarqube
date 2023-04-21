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
  description = "Sonarqube configurations"
}

variable "chart_version" {
  type        = string
  default     = "1.0.30"
  description = "Enter chart version of application"
}

variable "namespace" {
  type        = string
  default     = "sonarqube"
  description = "Enter namespace name"
}
