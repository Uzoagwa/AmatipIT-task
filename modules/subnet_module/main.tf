resource "aws_subnet" "Bethel_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.avail_zones
  tags = {
    Name = "${local.prefix}-subnet"
  }
}

resource "aws_internet_gateway" "Bethel_internet-gate-way" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${local.prefix}-igw"
  }
}

resource "aws_route_table" "Bethel_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.route_table_cidr_block
    gateway_id  = aws_internet_gateway.Bethel_internet-gate-way.id
    
  }
}

resource "aws_route_table_association" "Bethel_rt_association" {
  subnet_id      = aws_subnet.Bethel_subnet.id
  route_table_id = aws_route_table.Bethel_rt.id

}


