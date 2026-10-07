#Internet gateway
resource "aws_internet_gateway" "techpay_igw" {
  vpc_id = aws_vpc.techpay_vpc.id
  tags = {Name="techpay-igw"}
}
#Tabella di routing
resource "aws_route_table" "techpay_routing" {
  vpc_id = aws_vpc.techpay_vpc.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id= aws_internet_gateway.techpay_igw.id
  }
  tags = {Name="techpay-routing"}
}
#Associazione tabella di routing alle subnet pubbliche
resource "aws_route_table_association" "techpay-association-a" {
  subnet_id = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.techpay_routing.id
}
resource "aws_route_table_association" "techpay-association-b" {
  subnet_id = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.techpay_routing.id
}
resource "aws_route_table_association" "techpay-association-c" {
  subnet_id = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.techpay_routing.id
}