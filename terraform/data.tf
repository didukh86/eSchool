#Data AMI
data "aws_ami" "ubuntu-20" {
    owners = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20210223"]
  }

}

#AWS availability zones
data "aws_availability_zones" "available" {
  state = "available"
}