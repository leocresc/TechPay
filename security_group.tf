resource "aws_security_group" "techpay_alb_sg"{
  name = "techpay_alb_sg"
  description = "Consente traffico HTTP/HTTPS"
  vpc_id = aws_vpc.techpay_vpc.id
  ingress {
    from_port=80
    to_port=80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol= "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 65535
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }
}
resource "aws_security_group" "techpay_app_sg"{
  name = "techpay_app_sg"
  description = "Solo traffico con Load Balancer"
  vpc_id = aws_vpc.techpay_vpc.id
  ingress{
    from_port=8080
    to_port=8080
    protocol = "tcp"
    security_groups = [aws_security_group.techpay_alb_sg.id]
  }
  egress{
    protocol="tcp"
    from_port = 0
    to_port = 65535
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "techpay_db_sg" {
  name = "techpay_db_sg"
  vpc_id = aws_vpc.techpay_vpc.id
  ingress {
    from_port = 5432
    to_port = 5432
    protocol="tcp"
    security_groups = [aws_security_group.techpay_app_sg.id]
  }
}