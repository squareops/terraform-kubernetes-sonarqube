output "sonarqube" {
  description = "Sonarqube_Info"
  value = {
    username = "admin",
    password = nonsensitive(random_password.sonarqube_password.result),
    url      = var.sonarqube_config.hostname
  }
}

output "sonarqube_postgresql_password" {
  value       = random_password.postgresql_password.result
  description = "password for postgresql deployed with sonarqube"
  sensitive   = true
}

output "sonarqube_postgresql_username" {
  value       = "sonarUser"
  description = "username for postgresql deployed with sonarqube"
}
