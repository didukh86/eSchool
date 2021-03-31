#Subnet One (Publick) Eschool
resource "aws_subnet" "subnet-one" {
  vpc_id = aws_vpc.eschool_vpc.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-3a"
  tags = {
    "Name" = "EschoolMainSubnet"
  }
}

#Subnet Two (Private) Eschool
resource "aws_subnet" "subnet-two" {
  vpc_id = aws_vpc.eschool_vpc.id
  map_public_ip_on_launch = false
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-3b"
  tags = {
    "Name" = "EschoolPrivateSubnet"
  }
}

#Subnet Three (Private) Eschool
resource "aws_subnet" "subnet-three" {
  vpc_id = aws_vpc.eschool_vpc.id
  map_public_ip_on_launch = false
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-3c"
  tags = {
    "Name" = "EschoolPrivateSubnet"
  }
}

