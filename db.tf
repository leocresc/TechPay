resource "aws_db_subnet_group" "techpay_db_subnet_group"{
  name="techpay-db"
  subnet_ids = [aws_subnet.db_subnet_1a.id,aws_subnet.db_subnet_1b.id,aws_subnet.db_subnet_1c.id]
}
resource "aws_db_instance" "techpay_db_istance"{
  engine = "postgres"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  username = "leonardo"
  password = "leonardo1234"
  db_subnet_group_name = aws_db_subnet_group.techpay_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.techpay_db_sg.id]
  skip_final_snapshot = true
}
