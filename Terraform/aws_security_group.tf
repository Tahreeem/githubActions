resource "aws_security_group" "allow_ssh_public_ec2" {
  name        = "allow_ssh_public_ec2"
  description = "Allow SSH"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "allow_ssh_public_ec2"
  }
}