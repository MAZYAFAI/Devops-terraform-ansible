provider "aws" {
region = "ap-south-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0cca134ec43cf708f"
  instance_type = "t2.micro"
  key_name = "cicd-import"

  tags = {
    Name = "Maz-DevOps-Synechron-batch-server"
    env = "Production"
    owner = "Maz Yafai"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

