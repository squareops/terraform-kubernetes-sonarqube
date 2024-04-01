output "sonarqube" {
  description = "Information about the SonarQube instance, including the username, password, and URL."
  value       = module.sonarqube.sonarqube
}

output "postgresql_password" {
  description = "Password for the PostgreSQL database deployed with SonarQube."
  value       = module.sonarqube.sonarqube_postgresql_password
  sensitive   = true
}

output "postgresql_username" {
  description = "Username for the PostgreSQL database deployed with SonarQube."
  value       = "sonarUser"
}
