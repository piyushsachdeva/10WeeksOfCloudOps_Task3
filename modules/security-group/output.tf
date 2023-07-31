
output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "client_sg_id" {
  value = aws_security_group.client_sg.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}