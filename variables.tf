#  this file is used for variable definitions (root module)


variable "vpc_cidr_block" {
  description = "range of Ips for AmatipIT_vpc"
  type        = string
}
variable "subnet_cidr_block" {
  description = "range of subnet ips "
  type        = string
}
variable "avail_zones" {
  description = "value for availability zone"
  type        = string
}
variable "route_table_cidr_block" {
  description = "value for route table cidr block"
}
variable "ingress_sg_cidr_block" {
  description = "ingress sg value"
  type        = string
}
variable "instance_type" {
  description = "type of instance for Amatip-IT task server"
  type        = string
}





