data "terraform_remote_state" "network" {
  backend = "remote"
    config = {
      organization = "mediado"

      workspaces = {
      name = "ebook_dev_network"
    }
  }
}
data "terraform_remote_state" "ebook_file_upload_service_backend" {
  backend = "remote"
    config = {
      organization = "mediado"

      workspaces = {
      name = "ebook_dev_app_ebook_file_upload_service_backend"
    }
  }
}

data "terraform_remote_state" "strage" {
  backend = "remote"
    config = {
      organization = "mediado"

      workspaces = {
      name = "ebook_dev_strage"
    }
  }
}
