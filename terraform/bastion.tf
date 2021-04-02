resource "aws_instance" "bastion" {
  ami =  "ami-0d6aecf0f0425f42a"
  instance_type = "t2.micro"
  availability_zone = "eu-west-3a"
  key_name = "SoftServeKeyPair" 
#  user_data = file ("/home/didukh/Terraform/userDataScripts/asprocess.sh")

  provisioner "file" {
    source      = "/home/didukh/Documents/AWSCredentials/SoftServeKeyPair.pem"
    destination = "/home/ubuntu/SoftServeKeyPair.pem"

    connection {
    type     = "ssh"
    user     = "ubuntu"
    #password = "${var.root_password}"
    host     = aws_instance.bastion.public_ip
    private_key = file("/home/didukh/Documents/AWSCredentials/SoftServeKeyPair.pem")
  }
  }


  tags = {
    Name = "Bastion"
  }

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.bastion-network-interface.id
  }

}


#Network Interface for BE1
resource "aws_network_interface" "bastion-network-interface" {
  subnet_id       = aws_subnet.subnet-one.id
  private_ips     = ["10.0.1.5"]
  security_groups = [aws_security_group.eSchool-internal.id]
  
}