output "sonarqube" {
  description = "Information about the SonarQube instance, including the username, password, and URL."
  value = {
    username = "admin",
    password = nonsensitive(random_password.sonarqube_password.result),
    url      = var.sonarqube_config.hostname
  }
}

output "sonarqube_postgresql_password" {
  description = "Password for the PostgreSQL database deployed with SonarQube."
  value       = random_password.postgresql_password.result
  sensitive   = true
}

output "sonarqube_postgresql_username" {
  description = "Username for the PostgreSQL database deployed with SonarQube."
  value       = "sonarUser"

}
