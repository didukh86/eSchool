#VPC Eschool
resource "aws_vpc" "eschool_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    "Name" = "ESchoolVPC"
  }
}



#Internet Gateway
resource "aws_internet_gateway" "eschool-gateway" {
  vpc_id = aws_vpc.eschool_vpc.id
  tags = {
    Name = "EschoolInternetGateway"
  }
}

#Route Table
resource "aws_route_table" "eSchool-route-table" {
  vpc_id = aws_vpc.eschool_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eschool-gateway.id
  }
  tags = {
    Name = "EschoolRouteTable"
  }
}


#Route Table association
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-one.id
  route_table_id = aws_route_table.eSchool-route-table.id
}

#Route Table association
resource "aws_route_table_association" "b1" {
  subnet_id      = aws_subnet.subnet-4.id
  route_table_id = aws_route_table.eSchool-route-table.id
}

#Route Table association
resource "aws_route_table_association" "c1" {
  subnet_id      = aws_subnet.subnet-5.id
  route_table_id = aws_route_table.eSchool-route-table.id
}


