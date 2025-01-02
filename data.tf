#  data block is used to query existing resources from the specified provider(s)

data "aws_ami" "Bethel-server_ami" {

  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Ubuntu*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
