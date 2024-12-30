output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}
output "ec2_pvt_ip" {
  value = aws_instance.web.private_ip
}