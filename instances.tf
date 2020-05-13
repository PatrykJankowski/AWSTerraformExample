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

resource "aws_db_instance" "db" {
    allocated_storage    = 20
    storage_type         = "gp2"
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t2.micro"
    name                 = "db"
    username             = "admin"
    password             = "adminpassword"
}
