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
    hostname                       = "squareops.squareops.in"
    values_yaml                    = file("./helm/values.yaml")
    storage_class_name             = "gp2"
    sonarqube_volume_size          = "10Gi"
    postgresql_volume_size         = "20Gi"
    grafana_monitoring_enabled     = false
    monitoringPasscode             = "xxxxxxxxxxxxx"
    sonarqube_current_password     = "xxxxxxxxxx"     # if you upgrade sonarqube then you have to provide your previous sonarqube password
    postgresql_current_password    = "xxxxxxxxxxxxxx" # if you upgrade sonarqube then you have to provide your previous postgresql password
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
  }
}
