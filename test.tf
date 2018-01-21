provider "aws" {
  access_key = "XXX"
  secret_key = "XXX"
  region     = "eu-west-3"
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "exemple_ec" {
  ami           = "ami-dc13a4a1"
  instance_type = "t2.micro",
  key_name = "ansible_key",
  security_groups = [
	"${aws_security_group.allow_all.name}"
  ]
}