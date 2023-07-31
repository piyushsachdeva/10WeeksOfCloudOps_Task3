output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "pub_sub_1a_id" {
  value = aws_subnet.pub_sub_1a.id
}
output "pub_sub_2b_id" {
  value = aws_subnet.pub_sub_2b.id
}
output "pri_sub_3a_id" {
  value = aws_subnet.pri_sub_3a.id
}

output "pri_sub_4b_id" {
  value = aws_subnet.pri_sub_4b.id
}

output "pri_sub_5a_id" {
  value = aws_subnet.pri_sub_5a.id
}

output "pri_sub_6b_id" {
    value = aws_subnet.pri_sub_6b.id 
}

output "igw_id" {
    value = aws_internet_gateway.internet_gateway
}