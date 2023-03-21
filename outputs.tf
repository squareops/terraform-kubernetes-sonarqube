
output "sonarqube_password" {
  value       = nonsensitive(random_password.sonarqube_password.result)
  description = "Initial password for sonarqube"
}

output "sonarqube_username" {
  value       = "admin"
  description = "Initial username for sonarqube"
}

output "sonarqube_hostname" {
  value       = var.sonarqube_config.hostname
  description = "URL for sonarqube"
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
