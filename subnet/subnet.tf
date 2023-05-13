variable "vpc_id" {}
variable "cidr_block" {}

resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
}

output "subnet_id" {
  value = aws_subnet.main.id
}
