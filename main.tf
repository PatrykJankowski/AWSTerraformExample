resource "aws_instance" "example" {
  ami = "ami-076431be05aaf8080"
  instance_type = "t2.micro"
}