#VPC Eschool
resource "aws_vpc" "eschool_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    "Name" = "ESchoolVPC"
  }
}

#Subnet Eschool
resource "aws_subnet" "subnet-one" {
  vpc_id = aws_vpc.eschool_vpc.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    "Name" = "EschoolMainSubnet"
  }
}


#Internet Gateway
resource "aws_internet_gateway" "eschool-gateway" {
  vpc_id = aws_vpc.eschool_vpc.id

  tags = {
    Name = "EschoolGateway"
  }
}

#Route Table
resource "aws_route_table" "eSchool-route-table" {
  vpc_id = aws_vpc.eschool_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eschool-gateway.id
  }

  #route {
  # ipv6_cidr_block        = "::/0"
  #  egress_only_gateway_id = aws_egress_only_internet_gateway.foo.id
  #}

  tags = {
    Name = "EschoolRouteTable"
  }
}



#Route Table association
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-one.id
  route_table_id = aws_route_table.eSchool-route-table.id
}