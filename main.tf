provider "aws" {
  version = "~> 2.0"
  region = "us-est-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-02fe94dee086c0c37"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
}