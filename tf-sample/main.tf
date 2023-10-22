terraform {
  required_providers {
    aws = {
      source  = "aws"
      version = "5.22.0"
    }
  }
  backend "local" {
    path = "./terraform.aws_instance.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "compute" {
  ami           = "ami-0d48337b7d3c86f62"
  instance_type = "t2.micro"

  tags = {
    Name = "CDKTF-Demo"
  }
}

output "public_ip" {
  value = aws_instance.compute.public_ip
}
