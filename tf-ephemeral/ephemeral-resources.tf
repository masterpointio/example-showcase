ephemeral "random_password" "random_password_ephemeral" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "random_password_ephemeral_secret" {
  name = "random_password_ephemeral_secret"
}

resource "aws_secretsmanager_secret_version" "random_password_ephemeral_secret_version" {
  secret_id                = aws_secretsmanager_secret.random_password_ephemeral_secret.id
  secret_string_wo         = ephemeral.random_password.random_password_ephemeral.result
  secret_string_wo_version = 1
}
