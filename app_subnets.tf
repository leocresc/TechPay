resource "aws_subnet" "app_subnet_1a"{
  vpc_id = aws_vpc.techpay_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-1a"
  tags={Name="app-subnet-a"}
}
resource "aws_subnet" "app_subnet_1b"{
  vpc_id = aws_vpc.techpay_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "eu-west-1b"
  tags={Name="app-subnet-b"}
}
resource "aws_subnet" "app_subnet_1c"{
  vpc_id = aws_vpc.techpay_vpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "eu-west-1c"
  tags={Name="app-subnet-c"}
}
