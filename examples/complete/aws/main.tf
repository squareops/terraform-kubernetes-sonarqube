locals {
  name        = "sonarqube"
  region      = "us-east-1"
  environment = "prod"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "sonarqube" {
  source = "../../../"
  sonarqube_config = {
    hostname                       = "sonarqube.ldc.squareops.in"
    values_yaml                    = file("./helm/values.yaml")
    storage_class_name             = "gp2"
    sonarqube_volume_size          = "5Gi"
    postgresql_volume_size         = "20Gi"
    grafana_monitoring_enabled     = false
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
  }
}
