resource "aws_instance" "eSchool-load-balancer" {
  ami =  "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  availability_zone = "eu-central-1a"
  key_name = "eschool-key"
   
  user_data = file ("/home/didukh/Terraform/userDataScripts/loadBalancerscript.sh")
  
  tags = {
    Name = "eSchoolLB"
  }

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.lb-interface.id
  }
}


#Elastick IP for Load Balancer
resource "aws_eip" "elastic-ip-lb" {
  vpc                       = true
  network_interface         = aws_network_interface.lb-interface.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [
    aws_internet_gateway.eschool-gateway
  ]
}


#Network Interface for Load Balancer
resource "aws_network_interface" "lb-interface" {
  subnet_id       = aws_subnet.subnet-one.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.eSchool-internal.id]

}
