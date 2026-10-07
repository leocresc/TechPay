resource "aws_eip" "techpay_eip" {
  domain= "vpc"
  tags = {
    Name="techpay-eip"
  }
}
resource "aws_nat_gateway" "techpay_nat" {
  allocation_id = aws_eip.techpay_eip.id
  subnet_id = aws_subnet.public_subnet_1a.id
  tags={
    Name = "techpay-nat-gw"
  }
}
resource "aws_route_table" "techpay_private_rt"{
  vpc_id = aws_vpc.techpay_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.techpay_nat.id
  }
}
resource "aws_route_table_association" "app_association_a"{
  subnet_id = aws_subnet.app_subnet_1a.id
  route_table_id = aws_route_table.techpay_private_rt.id
}
resource "aws_route_table_association" "app_association_b"{
  subnet_id = aws_subnet.app_subnet_1b.id
  route_table_id = aws_route_table.techpay_private_rt.id
}
resource "aws_route_table_association" "app_association_c"{
  subnet_id = aws_subnet.app_subnet_1c.id
  route_table_id = aws_route_table.techpay_private_rt.id
}