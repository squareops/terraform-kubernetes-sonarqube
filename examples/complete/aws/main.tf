locals {
  name        = "test"
  region      = "us-east-1"
  environment = "dev"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}
module "sonarqube" {
  # source  = "squareops/sonarqube/kubernetes"
  # version = "3.1.1"
  source = "../../../"
  sonarqube_config = {
    hostname                       = "sonarqube.test.atmosly.in"
    values_yaml                    = file("./helm/values.yaml")
    storage_class_name             = "gp2"
    sonarqube_volume_size          = "5Gi"
    postgresql_volume_size         = "10Gi"
    grafana_monitoring_enabled     = false
    monitoringPasscode             = ""
    postgresql_password_external   = ""
    postgresql_external_server_url = ""
    sonarqube_password             = "" # secret must be 15 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character

    updateExistingSonarqube         = false # if you have existing sonarqube and want to upgrade,then enable it.
    updateExistingSonarqubePassword = false #if you want to update password,enable it and pass sonarqube_current_password(old),sonarqube_password(new)
    sonarqube_current_password      = ""    # if you upgrade sonarqube then you have to provide your previous sonarqube password ##Secret name=sonarqube-sonarqube-admin-password
    postgresql_current_password     = ""    # if you upgrade sonarqube then you have to provide your previous postgresql password  ##Secret name=sonarqube-postgresql
  }
}
