# Using a single workspace:
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "danilovbarbosa"

    workspaces {
      name = "testando123"
    }
  }
}

