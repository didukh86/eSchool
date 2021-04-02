resource "aws_security_group" "eSchool-internal" {
  name        = "eSchoolSecurityGroup"
  description = "Input and output internally"
  vpc_id = aws_vpc.eschool_vpc.id

lifecycle {
    create_before_destroy = true
  }


  ingress {
    description = "Allow internal communication in eschool_vpc"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

    ingress {
    description = "Allow internal communication in eschool_vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
  
  ingress {
    description = "Port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eSchoolSecurityGroup"
  }
}
