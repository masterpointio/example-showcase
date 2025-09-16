variable "api_key" {
  sensitive = true # Still stored in state!
  default   = "xK9#mP2$vL@4qR7!nT6&wZ8*bY3^fH5j-EXAMPLE_SECRET_IN_PLAINTEXT"
}

# Before - using sensitive (stored in state)
resource "aws_secretsmanager_secret_version" "sensitive_secret" {
  secret_id     = aws_secretsmanager_secret.sensitive_secret.id
  secret_string = var.api_key # ❌ Regular attribute - stored in state!
}

output "sensitive_secret" {
  value = aws_secretsmanager_secret_version.sensitive_secret.secret_string
  sensitive = true
}


variable "api_key_ephemeral" {
  ephemeral = true # Never stored!
  default   = "wJalrXUtnFEMI/K7MDENG/bPxRfiCY-EXAMPLE_SECRET_WONT_BE_STORED"
}

# After - using ephemeral (✅ never stored)
resource "aws_secretsmanager_secret_version" "ephemeral_secret" {
  secret_id                = aws_secretsmanager_secret.ephemeral_secret.id
  secret_string_wo         = var.api_key_ephemeral # ✅ Write only attribute - NOT stored!
  secret_string_wo_version = 1
}
