variable "aws_vpc" {
  type = string
}

variable "public_subnet" {
  type    = string
  default = ""
}

variable "availability_zone" {
  type    = string
  default = ""
}