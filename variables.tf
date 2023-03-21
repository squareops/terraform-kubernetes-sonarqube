variable "sonarqube_config" {
  type = any
  default = {
    hostname                       = ""
    enable_grafana_monitoring      = true
    sonarqube_volume_size          = ""
    storage_class_name             = ""
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
    postgresql_volume_size         = ""
    values_yaml                    = ""
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
