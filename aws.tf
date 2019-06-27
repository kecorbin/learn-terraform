resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"

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

output "ip" {
  value = aws_eip.ip.public_ip
}
