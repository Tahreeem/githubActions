resource "aws_vpc" "main_vpc" {
  cidr_block = var.aws_vpc

  tags = {
    Name = "Main VPC"
  }
}