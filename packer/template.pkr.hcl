packer {
  required_version = ">= 1.7.0"
}

source "amazon-ebs" "source_name" {
  ami_name                    = "packer-test-ami-{{timestamp}}"
  instance_type               = "t3.small"
  source_ami                  = "ami-0cff7528ff583bf9a"
  vpc_id                      = "vpc-07375ee25417f2106"
  associate_public_ip_address = true
  subnet_id                   = "subnet-0186d05342ffbb8f9"
  ssh_username                = "ec2-user"
  ssh_interface               = "public_ip"
  region                      = "us-east-1"
}

build {
  # use the `name` field to name a build in the logs.
  # For example this present config will display
  # "buildname.amazon-ebs.example-1" and "buildname.amazon-ebs.example-2"
  name = "buildname"

  sources = [
    # use the optional plural `sources` list to simply use a `source`
    # without changing any field.
    "source.amazon-ebs.source_name",
  ]

  provisioner "ansible" {
      playbook_file = "../ansible-practice/playbook-01.yml"
      extra_arguments = [ "-vvvv" ]
  }

  //   post-processor "shell-local" {
  //     inline = ["echo Hello World from ${source.type}.${source.name}"]
  //   }
}