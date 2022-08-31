# // Ports 0 to 1023 are usually reserved for machine - above that are for applications
resource "aws_security_group_rule" "public_subnet_ec2_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["99.232.228.97/32"]
  security_group_id = aws_security_group.allow_ssh_public_ec2.id
}

resource "aws_security_group_rule" "public_subnet_ec2_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_ssh_public_ec2.id
}