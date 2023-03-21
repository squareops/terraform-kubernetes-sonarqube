
output "password" {
  value       = module.sonarqube.sonarqube_password
  description = "Initial password for sonarqube"
}

output "username" {
  value       = "admin"
  description = "Initial username for sonarqube"
}

output "hostname" {
  value       = module.sonarqube.sonarqube_hostname
  description = "URL for sonarqube"
}

output "postgresql_password" {
  value       = module.sonarqube.sonarqube_postgresql_password
  description = "password for postgresql deployed with sonarqube"
  sensitive   = true
}

output "postgresql_username" {
  value       = "sonarUser"
  description = "username for postgresql deployed with sonarqube"
}
