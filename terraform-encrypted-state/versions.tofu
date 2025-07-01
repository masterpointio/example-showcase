terraform {
  required_version = ">= 1.7" # Encrypted state available in OpenTofu 1.7 and later

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }

  encryption {
    method "unencrypted" "migrate" {} # to support the current unencrypted state

    key_provider "aws_kms" "kms_key" {
      kms_key_id = "INSERT_KMS_KEY_ID_HERE"
      region     = "us-east-1"
      key_spec   = "AES_256"
    }

    method "aes_gcm" "kms" {
      keys = key_provider.aws_kms.kms_key
    }

    state {
      method   = method.aes_gcm.kms
      fallback {
        method = method.unencrypted.migrate
      }
    }
  }

}
