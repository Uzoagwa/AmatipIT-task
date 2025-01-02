#  define a provider or providers to use, I'm more comfortable with aws
provider "aws" {
  region = "eu-west-3"

}


# this locals block is used to define variables that can be used across multiple environments.
locals {
  prefix = terraform.workspace
}

#  create a vpc resource 
resource "aws_vpc" "Bethel_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${local.prefix}-vpc"
  }
}


module "Bethel_subnet" {
  source                 = "./modules/subnet_module"
  vpc_id                 = aws_vpc.Bethel_vpc.id
  subnet_cidr_block      = var.subnet_cidr_block
  avail_zones            = var.avail_zones
  route_table_cidr_block = var.route_table_cidr_block
}

module "Bethel_server" {
  source                = "./modules/ec2_module"
  ingress_sg_cidr_block = var.ingress_sg_cidr_block
  avail_zones           = var.avail_zones
  instance_type         = var.instance_type
  vpc_id                = aws_vpc.Bethel_vpc.id
  subnet_id             = module.Bethel_subnet.subnet_id

}



