
resource "aws_subnet" "public_subnet_1a"{
  vpc_id = aws_vpc.techpay_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
  tags={Name="public-subnet-a"}
}
resource "aws_subnet" "public_subnet_1b"{
  vpc_id = aws_vpc.techpay_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = true
  tags={Name="public-subnet-b"}
}
resource "aws_subnet" "public_subnet_1c"{
  vpc_id = aws_vpc.techpay_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-1c"
  map_public_ip_on_launch = true
  tags={Name="public-subnet-c"}
}
