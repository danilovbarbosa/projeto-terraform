provider "aws" {
  version = "~> 2.0"
  region = "us-est-1"
}

resource "aws_instance" "dev" {
  ami = "value"
}