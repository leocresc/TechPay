resource "aws_lb" "techpay_alb"{
  internal = false
  security_groups = [aws_security_group.techpay_alb_sg.id]
  subnets = [aws_subnet.public_subnet_1a.id,aws_subnet.public_subnet_1b.id,aws_subnet.public_subnet_1c.id]
  name = "techpay-alb"
  load_balancer_type = "application"
}
resource "aws_lb_target_group" "techpay_alb_target_group"{
  name="techpay-alb-target-group"
  port= 8080
  protocol = "HTTP"
  vpc_id = aws_vpc.techpay_vpc.id
}
resource "aws_lb_listener" "techpay_listener"{
  load_balancer_arn = aws_lb.techpay_alb.arn
  port=80
  protocol="HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.techpay_alb_target_group.arn
  }
}