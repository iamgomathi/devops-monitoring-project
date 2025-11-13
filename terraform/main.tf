provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devops_server" {
  ami           = "ami-0cae6d6fe6048ca2c"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  tags = {
    Name = "DevOps-Monitoring-Server"
  }
}

