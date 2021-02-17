provider "aws" {
    alias = "us-east-2"
    version = "~> 2.0"
    region = "us-east-2"
}

resource "aws_instance" "dev6" {
  ami = "ami-02fe94dee086c0c37"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = [ aws_security_group.acesso_ssh_us_east_2.id, ]
}