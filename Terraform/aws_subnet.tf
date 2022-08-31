resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnet
  availability_zone = var.availability_zone
  # availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "Public Subnet"
  }
}