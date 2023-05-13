variable "vpc_id" {}
variable "igw_id" {}

resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
}

output "route_table_id" {
  value = aws_route_table.main.id
}
