resource "aws_security_group" "Bethel_sg" {
    vpc_id = var.vpc_id
    name = "Bethel_sg"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.ingress_sg_cidr_block]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.ingress_sg_cidr_block]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.ingress_sg_cidr_block]
        prefix_list_ids = []
    }
}


 


resource "aws_instance" "Bethel_server" {
  ami = data.aws_ami.ubuntu.id
  key_name = "bethel@key"
  vpc_security_group_ids = [aws_security_group.Bethel_sg.id]
  instance_type = var.instance_type
  subnet_id =  var.subnet_id

  associate_public_ip_address = true
  tags = {
    Name = "${local.prefix}-server"
  }
  user_data = file("./myscript.sh")
}

resource "aws_ec2_instance_connect_endpoint" "example" {
  subnet_id = var.subnet_id
}

resource "aws_db_instance" "Bethel_db" {
  allocated_storage    = 10
  db_name              = "Bethel_db"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "Bethel_user"
  password             = "Bethelpassword"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

