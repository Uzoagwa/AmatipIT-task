# this outputs the instance public ip address

output "instance_public_ip" {
  value = aws_instance.Bethel_server.public_ip
}
