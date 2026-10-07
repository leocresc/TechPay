resource "aws_subnet" "db_subnet_1a"{
  vpc_id = aws_vpc.techpay_vpc.id
  cidr_block = "10.0.7.0/24"
  availability_zone = "eu-west-1a"
  tags={Name="db-subnet-a"}
}
resource "aws_subnet" "db_subnet_1b"{
  vpc_id = aws_vpc.techpay_vpc.id
  cidr_block = "10.0.8.0/24"
  availability_zone = "eu-west-1b"
  tags={Name="db-subnet-b"}
}
resource "aws_subnet" "db_subnet_1c"{
  vpc_id = aws_vpc.techpay_vpc.id
  cidr_block = "10.0.9.0/24"
  availability_zone = "eu-west-1c"
  tags={Name="db-subnet-c"}
}
