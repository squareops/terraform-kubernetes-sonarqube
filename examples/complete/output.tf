output "sonarqube" {
  description = "Sonarqube_Info"
  value       = module.sonarqube.sonarqube
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
