


#Launch_configuration
  resource "aws_launch_configuration" "eschool-launch-configuration" {
  name          = "eSchoolBE"
  image_id      = data.aws_ami.ubuntu-20.id
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.eSchool-internal.id]
  user_data = file("/home/didukh/Terraform/userDataScripts/asprocess.sh")
  key_name = "SoftServeKeyPair"
  depends_on = [
    aws_nat_gateway.eschool-nat
  ]

  lifecycle {
    create_before_destroy = true
  }

  }
#Autoscaling_group
  resource "aws_autoscaling_group" "eschool-autoscaling-group" {
  name                 = "eschool-autoscaling-group"
  launch_configuration = aws_launch_configuration.eschool-launch-configuration.name
  #availability_zones = [ data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]]
  min_size = 2
  max_size = 2
  min_elb_capacity = 2 
  vpc_zone_identifier = [aws_subnet.subnet-two.id, aws_subnet.subnet-three.id]
  health_check_type = "ELB"
  load_balancers = [ aws_elb.eschool-be-lb.name ]

  tag {
    key = "Name"
    value = "ASGBackendInstance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

#Load Balancer
resource "aws_elb" "eschool-be-lb" {
  name = "EschoolBeLb"
  #availability_zones = [ data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]]
    

  subnets = [aws_subnet.subnet-4.id, aws_subnet.subnet-5.id]
  #subnets = [aws_subnet.subnet-two.id, aws_subnet.subnet-three.id ]
  security_groups = [
      aws_security_group.eSchool-internal.id
  ]
  idle_timeout = 120

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 8080
    lb_protocol       = "http"
  }

    health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 3
    interval            = 30
    target              = "HTTP:8080/ui/login"
    
  }

 
    tags = {
        Name = "eSchoolBELB"
    }

  
}

