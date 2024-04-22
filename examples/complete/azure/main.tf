locals {
  name        = "sonarqube"
  region      = "eastus"
  environment = "prod"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "sonarqube" {
  source = "https://github.com/sq-ia/terraform-kubernetes-sonarqube.git"
  sonarqube_config = {
    hostname                       = "sonarqube.skaf.squareops.in"
    values_yaml                    = file("./helm/values.yaml")
    storage_class_name             = "infra-service-sc"
    sonarqube_volume_size          = "5Gi"
    postgresql_volume_size         = "20Gi"
    grafana_monitoring_enabled     = false
    postgresql_password_external   = "admin"
    postgresql_external_server_url = ""
  }
}
