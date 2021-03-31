
resource "aws_instance" "mariaDB" {
  ami =  "ami-0d6aecf0f0425f42a"
  instance_type = "t2.micro"
  availability_zone = "eu-west-3b"
  key_name = "SoftServeKeyPair"

  user_data = file ("/home/didukh/Terraform/userDataScripts/mariaDBRun.sh")
  tags = {
    Name = "MariaDB"
  }

    network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.database-mariadb-interface.id
  }
}


#Network Interface for DB
resource "aws_network_interface" "database-mariadb-interface" {
  subnet_id       = aws_subnet.subnet-two.id
  private_ips     = ["10.0.2.100"]
  security_groups = [aws_security_group.eSchool-internal.id]

}

/*
#Elastick IP for DB
resource "aws_eip" "elastic-ip-DB" {
  vpc                       = true
  network_interface         = aws_network_interface.database-mariadb-interface.id
  associate_with_private_ip = "10.0.1.100"
  depends_on = [
    aws_internet_gateway.eschool-gateway
  ]
}
*/