locals {
  region = "us-east-2"
  additional_tags = {
    Name        = "skaf"
    environment = "prod"
  }
}

module "sonarqube" {
  source = "../../"
  sonarqube_config = {
    hostname                       = "sonarqubesquareops.in"
    enable_grafana_monitoring      = false
    sonarqube_volume_size          = "5Gi"
    storage_class_name             = "gp2"
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
    postgresql_volume_size         = "20Gi"
    values_yaml                    = file("./helm/values.yaml")
  }
}
