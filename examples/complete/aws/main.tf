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
  source  = "../../.."
  sonarqube_config = {
    hostname                       = "sonarqube.squareops.in"
    values_yaml                    = file("./helm/values.yaml")
    storage_class_name             = "gp2"
    sonarqube_volume_size          = "10Gi"
    postgresql_volume_size         = "20Gi"
    grafana_monitoring_enabled     = false
    monitoringPasscode             = "xxxxxxx"
    sonarqube_current_password     = "xxxxxxx"     # if you upgrade sonarqube then you have to provide your previous sonarqube password ##Secret name=sonarqube-postgresql
    postgresql_current_password    = "xxxxxxxxxxx" # if you upgrade sonarqube then you have to provide your previous postgresql password ##Secret name=sonarqube-sonarqube-admin-password
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
  }
}
