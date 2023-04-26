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
    hostname                       = "sonarqube.ref.dev.skaf.squareops.in"
    values_yaml                    = file("./helm/values.yaml")
    storage_class_name             = "gp2"
    sonarqube_volume_size          = "5Gi"
    postgresql_volume_size         = "20Gi"
    grafana_monitoring_enabled     = false
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
  }
}
