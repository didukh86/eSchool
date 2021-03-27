output "BE1_ip" {
  value = aws_instance.eSchool-Backend1.public_ip
}

output "BE2_ip" {
  value = aws_instance.eSchool-Backend2.public_ip
}

output "LB_ip" {
  value = aws_instance.eSchool-load-balancer.public_ip
}