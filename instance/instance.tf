variable "subnet_id" {}
variable "vpc_security_group_ids" { type = list }
variable "key_name" {}

resource "aws_instance" "main" {
  ami           = "ami-0481e8ba7f486bd99"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = true
  key_name = var.key_name
}

output "public_ip" {
  value = aws_instance.main.public_ip
}