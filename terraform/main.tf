provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "michicode_sg" {
  name        = "michicode-sg-final"
  description = "Permitir App, Monitoreo y SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "michicode_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.small"
  key_name      = "michicode-key"
  vpc_security_group_ids = [aws_security_group.michicode_sg.id]

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name = "MichiCode-Final-Server"
  }
}