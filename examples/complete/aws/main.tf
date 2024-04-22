locals {
  name        = "sonarqube"
  region      = "ap-northeast-1"
  environment = "stg"
  additional_aws_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "sonarqube" {
  # source = "https://github.com/sq-ia/terraform-kubernetes-sonarqube.git"
  source = "../../../"
  sonarqube_config = {
    hostname                       = "sonarqube.test.atmosly.in"
    values_yaml                    = file("./helm/values.yaml")
    storage_class_name             = "gp2"
    sonarqube_volume_size          = "5Gi"
    postgresql_volume_size         = "20Gi"
    grafana_monitoring_enabled     = true
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
  }
}
