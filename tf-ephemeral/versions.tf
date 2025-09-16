terraform {
  required_version = ">= 1.11.0" # Ephemeral resources and variables are only available in Terraform 1.11 and later

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
}
