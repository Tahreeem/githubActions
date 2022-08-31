// need to associate the route table below with public subnet, 
// otherwise aws will associate the default route table that comes with vpc with public subnet
resource "aws_route" "public_subnet_route" {
  route_table_id         = aws_route_table.public_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
  depends_on             = [aws_route_table.public_subnet_route_table]
}