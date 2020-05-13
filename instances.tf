resource "aws_instance" "web-1" {
    ami = lookup(var.amis, var.aws_region)
    availability_zone = "eu-central-1a"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.web.id]
    subnet_id = aws_subnet.eu-central-1a-public.id

    tags = {
        Name = "Web Server 1"
    }
}

resource "aws_instance" "db-1" {
    ami = lookup(var.amis, var.aws_region)
    availability_zone = "eu-central-1a"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.db.id]
    subnet_id = aws_subnet.eu-central-1a-private.id

    tags = {
        Name = "DB Server 1"
    }
}
