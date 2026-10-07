resource "aws_autoscaling_group" "techpay_autoscaling"{
  min_size = 1
  desired_capacity = 2
  max_size = 3
  vpc_zone_identifier = [aws_subnet.app_subnet_1a.id,aws_subnet.app_subnet_1b.id,aws_subnet.app_subnet_1c.id]
  target_group_arns = [aws_lb_target_group.techpay_alb_target_group.arn]
  launch_template {
    id = aws_launch_template.techpay_ec2.id
    version = "$Latest"
  }
}
