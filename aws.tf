resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
  key_name = "kcorbin-keypair"

  tags = {
    owner = "kcorbin"
    FOO   = "bar"
    FIZZ  = "buzz"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = aws_instance.example.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
     protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ip" {
  value = aws_eip.ip.public_ip
}
