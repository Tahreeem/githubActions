resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Public Subnet Route Table"
  }
}