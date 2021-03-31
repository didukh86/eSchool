resource "aws_instance" "eSchool-Backend1" {
  ami =  "ami-0d6aecf0f0425f42a"
  instance_type = "t2.micro"
  availability_zone = "eu-west-3b"
  key_name = "SoftServeKeyPair" 
  user_data = file ("/home/didukh/Terraform/userDataScripts/asprocess.sh")
  tags = {
    Name = "eSchoolBE1"
  }

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.eSchool-Backend1-interface.id
  }

}



#Network Interface for BE1
resource "aws_network_interface" "eSchool-Backend1-interface" {
  subnet_id       = aws_subnet.subnet-two.id
  private_ips     = ["10.0.2.10"]
  security_groups = [aws_security_group.eSchool-internal.id]
  
}

/*
#Elastick IP for BE1
resource "aws_eip" "elastic-ip-Backend1" {
  vpc                       = true
  network_interface         = aws_network_interface.eSchool-Backend1-interface.id
  associate_with_private_ip = "10.0.2.10"
  depends_on = [
    aws_internet_gateway.eschool-gateway
  ]
}
*/
