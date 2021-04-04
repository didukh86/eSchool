

#Elastic ip for NAT gateway
resource "aws_eip" "nat-elastic-ip" {
 vpc = true
 depends_on = [
   aws_internet_gateway.eschool-gateway
 ]
}

#aws_nat_gateway for Private subnet
resource "aws_nat_gateway" "eschool-nat" {
  allocation_id = aws_eip.nat-elastic-ip.id
  subnet_id     = aws_subnet.subnet-one.id

 depends_on = [
   aws_internet_gateway.eschool-gateway
 ]
  tags = {
    Name = "eschool-nat"
  }
}

#Route table 
resource "aws_route_table" "subnet-two-route-table" {
  vpc_id = aws_vpc.eschool_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eschool-nat.id
  }

  tags = {
    Name = "subnet-two-route-table"
  }
}

#Route Table association b
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet-two.id
  #route_table_id = aws_route_table.eSchool-route-table.id
  route_table_id = aws_route_table.subnet-two-route-table.id
}

#Route Table association c
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet-three.id
  #route_table_id = aws_route_table.eSchool-route-table.id
  route_table_id = aws_route_table.subnet-two-route-table.id
}

