resource "aws_kms_key" "tf_state" {
  description             = "KMS key for Terraform/OpenTofu state encryption"
}

output "kms_key_id" {
  value       = aws_kms_key.tf_state.key_id
  description = "KMS key id"
}
