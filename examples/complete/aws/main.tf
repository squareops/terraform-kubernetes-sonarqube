locals {
  name        = ""
  region      = ""
  environment = ""
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "sonarqube" {
  source  = "squareops/sonarqube/kubernetes"
  version = "3.1.0"
  sonarqube_config = {
    hostname                       = "sonarqube.squareops.in"
    values_yaml                    = file("./helm/values.yaml")
    storage_class_name             = ""
    sonarqube_volume_size          = ""
    postgresql_volume_size         = ""
    grafana_monitoring_enabled     = false
    sonarqube_current_password     = "" # if you upgrade sonarqube then you have to provide your previous sonarqube password
    postgresql_current_password    = "" # if you upgrade sonarqube then you have to provide your previous postgresql password
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
  }
}
