locals {
  name        = "test"
  region      = "ap-south-1"
  environment = "squareops"
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
    storage_class_name             = "gp2"
    sonarqube_volume_size          = "5Gi"
    postgresql_volume_size         = "10Gi"
    grafana_monitoring_enabled     = false
    monitoringPasscode             = ""
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
    sonarqube_password             = ""

    updateExistingSonarqube     = true
    sonarqube_current_password  = "orWZVlhIXZvD3W4RXA7h" # if you upgrade sonarqube then you have to provide your previous sonarqube password ##Secret name=sonarqube-postgresql
    postgresql_current_password = "ZIMOR6c3joeYJvAyVUnu" # if you upgrade sonarqube then you have to provide your previous postgresql password ##Secret name=sonarqube-sonarqube-admin-password
  }
}
