locals {
  count = var.sonarqube_config.postgresql_external_server_url != "" ? [] : [1]
}
resource "random_password" "sonarqube_password" {
  length  = 20
  special = true
}
resource "random_password" "postgresql_password" {
  length  = 20
  special = true
}
resource "random_password" "monitoringPasscode" {
  length  = 20
  special = true
}
resource "kubernetes_namespace" "sonarqube" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "sonarqube" {
  depends_on = [kubernetes_namespace.sonarqube]
  name       = "sonarqube"
  chart      = "sonarqube"
  timeout    = 600
  version    = var.chart_version
  namespace  = var.namespace
  repository = "https://sonarsource.github.io/helm-chart-sonarqube"
  values = [
    templatefile("${path.module}/helm/values.yaml", {
      monitoringPasscode             = var.sonarqube_config.monitoringPasscode != "" ? var.sonarqube_config.monitoringPasscode : random_password.monitoringPasscode.result
      hostname                       = var.sonarqube_config.hostname
      volume_size                    = var.sonarqube_config.sonarqube_volume_size
      sonarqube_sc                   = var.sonarqube_config.storage_class_name
      postgresql_enable              = var.sonarqube_config.postgresql_external_server_url != "" ? false : true
      sonarqube_password             = var.sonarqube_config.sonarqube_password != "" ? var.sonarqube_config.sonarqube_password : random_password.sonarqube_password.result
      sonarqube_current_password     = var.sonarqube_config.updateExistingSonarqube == true ? var.sonarqube_config.sonarqube_current_password : "admin"
      postgresql_password            = var.sonarqube_config.postgresql_current_password != "" && var.sonarqube_config.updateExistingSonarqube == true ? var.sonarqube_config.postgresql_current_password : random_password.postgresql_password.result
      postgresql_disk_size           = var.sonarqube_config.postgresql_volume_size
      prometheus_exporter_enable     = var.sonarqube_config.grafana_monitoring_enabled
      postgresql_external_server_url = var.sonarqube_config.postgresql_external_server_url
      postgresql_password_external   = var.sonarqube_config.postgresql_password_external

    }),
    var.sonarqube_config.values_yaml
  ]
  dynamic "set" {
    for_each = local.count
    content {
      name  = "postgresql.postgresqlServer"
      value = var.sonarqube_config.postgresql_external_server_url
    }
  }

  dynamic "set" {
    for_each = local.count
    content {
      name  = "postgresql.existingSecretPasswordKey"
      value = var.sonarqube_config.postgresql_password_external
    }
  }
}
resource "kubernetes_manifest" "migration_job" {
  count = var.sonarqube_config.updateExistingSonarqube ? 1 : 0
  manifest = {
    apiVersion = "batch/v1"
    kind       = "Job"
    metadata = {
      name      = "db-migration-watcher-job"
      namespace = "sonarqube"
    }
    spec = {
      backoffLimit = 4
      completions  = 1
      parallelism  = 1
      template = {
        spec = {
          restartPolicy = "Never"
          containers = [
            {
              name  = "db-migration-watcher"
              image = "alpine:latest"
              command = [
                "/bin/sh", "-c", <<-EOT
                  sleep 180 &&
                  apk add --no-cache curl &&
                  curl -s -X POST -u admin:"${var.sonarqube_config.sonarqube_current_password}" "http://sonarqube-sonarqube:9000/api/system/migrate_db" &&
                  echo "DB Migration triggered. Exiting watcher."
                EOT
              ]
            }
          ]
        }
      }
    }
  }
}
