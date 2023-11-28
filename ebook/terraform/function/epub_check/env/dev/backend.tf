provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "remote" {
    organization = "mediado"

    workspaces {
      name = "ebook_dev_function_epub_check"
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
