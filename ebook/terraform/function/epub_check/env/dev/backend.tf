provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "remote" {
    organization = "Test-Abhinav"

    workspaces {
      name = "Repo118"
    }
  }
  # backend "local" {
  #   path = "terraform.tfstate"
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }
}
