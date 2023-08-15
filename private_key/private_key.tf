resource "tls_private_key" "generated" {
  algorithm = "RSA"
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.generated.private_key_pem
  filename = "private_key.pem"

  provisioner "local-exec" {
    command = "chmod 600 ${self.filename}"
  }
}

resource "aws_key_pair" "key_pair" {
  key_name   = "private_key"
  public_key = tls_private_key.generated.public_key_openssh
}

output "key_name" {
  value = aws_key_pair.key_pair.key_name
}

output "key_path" {
  value = local_file.private_key_pem.filename
}