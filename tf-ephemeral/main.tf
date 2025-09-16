########################################################################################
# Create the secrets in AWS Secrets Manager
# There is no secret stored in these resources. The actual secret is managed by the `aws_secretsmanager_secret_version` resource.
########################################################################################
resource "aws_secretsmanager_secret" "sensitive_secret" {
  name = "demo-sensitive-secret"
}

resource "aws_secretsmanager_secret" "ephemeral_secret" {
  name = "demo-ephemeral-secret"
}
