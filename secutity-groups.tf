resource "aws_security_group" "web" {
  name = "vpc_web"
  description = "HTTP(S) connections"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [var.private_subnet_cidr]
  }

  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Web Server"
  }
}

resource "aws_security_group" "db" {
  name = "vpc_db"
  description = "Database connections"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = [var.vpc_cidr]
  }

  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Database Server"
  }
}
