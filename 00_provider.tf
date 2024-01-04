terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

# configuration du provider AWS
provider "aws" {
  region     = "eu-west-3" # definition de la region utilisé
  access_key = var.a_key # clé d'accés AWS
  secret_key = var.s_key # clé secrete
}
