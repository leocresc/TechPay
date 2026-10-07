data "aws_ami" "amazon_linux"{
  most_recent = true
  owners = ["amazon"]
  filter{
    name="name"
    values=["al2023-ami-2023.*-x86_64"]
  }
}
resource "aws_launch_template" "techpay_ec2"{
  name_prefix = "techpay-app"
  image_id = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.techpay_app_sg.id]
}
