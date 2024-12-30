data "aws_vpc" "default_vpc" {
  id = "<VPC_ID>"
}

data "aws_subnet" "public_subnet" {
   vpc_id = data.aws_vpc.default_vpc.id
   availability_zone = "us-east-1d"
}

data "aws_key_pair" "ec2_key_pair" {
  key_name = "test"
}

resource "aws_security_group" "ec2" {
  name        = "terraform-sg"
  description = "Allow ssh inbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description = "incoming traffic from anywhere using ssh"
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
}

module "ec2"  {
    source = "./ec2"
    depends_on = [aws_efs_mount_target.efs-mt]
    instance_name = "terraform-ec2-1"
    subnet_id = data.aws_subnet.public_subnet.id
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    key_name = data.aws_key_pair.ec2_key_pair.key_name
    security_group_id = aws_security_group.ec2.id
    efs_id = aws_efs_file_system.efs.id
    iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
}  
