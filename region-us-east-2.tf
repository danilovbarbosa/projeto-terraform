provider "aws" {
    alias = "us-east-2"
    version = "~> 2.0"
    region = "us-east-2"
}

resource "aws_instance" "dev6" {
  provider = aws.us-east-2
  ami = "ami-01aab85a5e4a5a0fe"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = [ aws_security_group.acesso_ssh_us_east_2.id, ]
  depends_on = [ aws_dynamodb_table.dynamodb-homologacao, ]
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = aws.us-east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}