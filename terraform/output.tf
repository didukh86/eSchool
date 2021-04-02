/*
output "BE1_ip" {
  value = aws_instance.eSchool-Backend1.public_ip
}

output "BE2_ip" {
  value = aws_instance.eSchool-Backend2.public_ip
}

output "LB_ip" {
  value = aws_instance.eSchool-load-balancer.public_ip
}
*/

output "NAT_ip" {
  value = aws_nat_gateway.eschool-nat.public_ip
}

output "Bastion_ip" {
  value = aws_instance.bastion.public_ip
}

output "web_loadbalancer_url" {
  value = aws_elb.eschool-be-lb.dns_name
}