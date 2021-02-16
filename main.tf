provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-02fe94dee086c0c37"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = [ aws_security_group.acesso_ssh.id, ]
}

resource "aws_instance" "dev4" {
  ami = "ami-02fe94dee086c0c37"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = [ aws_security_group.acesso_ssh.id, ]
  depends_on = [ aws_s3_bucket.bucket-lab-dev4 ]
}

resource "aws_instance" "dev5" {
  ami = "ami-02fe94dee086c0c37"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = [ aws_security_group.acesso_ssh.id, ]
}

resource "aws_s3_bucket" "bucket-lab-dev4" {
  bucket = "bucket-lab-dev4"
  acl    = "private"
  
  tags = {
    Name = "bucket-lab-dev4"
  }
}