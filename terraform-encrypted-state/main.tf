# Generate a random password
resource "random_password" "main_password" {
  length  = 128
  special = false
  upper   = true
  lower   = true
  numeric = true
}

# Create AWS Secrets Manager secret
resource "aws_secretsmanager_secret" "main_password" {
  name                    = "main-application-password"
  description             = "Main application password"
}

# Store the password in the secret
resource "aws_secretsmanager_secret_version" "main_password" {
  secret_id     = aws_secretsmanager_secret.main_password.id
  secret_string = random_password.main_password.result
}
