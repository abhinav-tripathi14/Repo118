terraform {
  backend "remote" {
    organization = "Test-Abhinav"

    workspaces {
      name = "Repo118"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }
}
