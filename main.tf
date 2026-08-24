provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-01a00762f46d584a1"
  instance_type          = "c7i-flex.large"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-063802edb6a0a5bac"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "appserver-1", "Monitoring server"]
}
