variable "subnet_id" {}
variable "vpc_security_group_ids" { type = list(any) }
variable "key_name" {}
variable "key_path" {}

resource "aws_instance" "main" {
  ami                         = "ami-0481e8ba7f486bd99"
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = true
  key_name                    = var.key_name

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.key_path)
      host        = aws_instance.main.public_ip
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.main.public_ip}, -u ubuntu --private-key ${var.key_path} setup.yaml"
  }
}

output "public_ip" {
  value = aws_instance.main.public_ip
}