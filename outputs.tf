output "efs-id"{
    value = aws_efs_file_system.efs.id
}

output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

output "ec2_pvt_ip" {
  value = module.ec2.ec2_pvt_ip
}
