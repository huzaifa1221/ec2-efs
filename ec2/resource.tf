resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile = var.iam_instance_profile
  user_data = templatefile("PROJECT_PATH/ec2/script.sh",{
        efs_id      = var.efs_id })
  tags = {
    Name = var.instance_name
  }
}


