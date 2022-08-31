data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name" // change this to what i specified
    values = ["packer-test-ami-*"]
  }

  filter {
    name   = "virtualization-type" 
    values = ["hvm"]
  }

  owners = ["self"] // owner will be "self"
}

resource "aws_instance" "public_subnet_ec2" {
  ami                         = data.aws_ami.ubuntu.id
  # ami                         = "ami-07e9a9afeee1e7b12" // use the filters in above to find the created ami image
  instance_type               = "t3.nano"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh_public_ec2.id]
  key_name                    = "instance_rsa_june"

  tags = {
    Name = "Public Subnet EC2"
  }
}