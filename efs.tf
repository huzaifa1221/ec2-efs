resource "aws_efs_file_system" "efs" {
  creation_token = "terraform-efs"
  performance_mode = "generalPurpose"
  lifecycle_policy {
    transition_to_ia = "AFTER_90_DAYS"
  }
}

resource "aws_efs_mount_target" "efs-mt" {
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = data.aws_subnet.public_subnet.id
   security_groups = [aws_security_group.efs.id]
}

resource "aws_security_group" "efs" {
   name = "efs-sg"
   description= "Allow inbound efs traffic from ec2"
   vpc_id = data.aws_vpc.default_vpc.id

   ingress {
     security_groups = [aws_security_group.ec2.id]
     from_port = 2049
     to_port = 2049 
     protocol = "tcp"
   }     
        
   egress {
     security_groups = [aws_security_group.ec2.id]
     from_port = 0
     to_port = 0
     protocol = "-1"
   }
}


