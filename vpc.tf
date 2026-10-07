resource "aws_vpc" "techpay_vpc"{
  cidr_block = "10.0.0.0/16"
  tags = {Name="techpay-vpc"}
}
