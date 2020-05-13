resource "aws_vpc" "main_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
	tags = {
		Name = "Main VPC"
    }
}

resource "aws_internet_gateway" "main_ig" {
    vpc_id = aws_vpc.main_vpc.id
}

resource "aws_subnet" "eu-central-1a-public" {
    vpc_id = aws_vpc.main_vpc.id

    cidr_block = var.public_subnet_cidr
    availability_zone = "sa-east-1a"

    tags = {
        Name = "Public Subnet"
    }
}

resource "aws_subnet" "eu-central-1a-private" {
    vpc_id = aws_vpc.main_vpc.id

    cidr_block = var.private_subnet_cidr
    availability_zone = "sa-east-1a"

    tags = {
        Name = "Private Subnet"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main_ig.id
    }

    tags = {
        Name = "Public Subnet Route Table"
    }
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.main_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
    }

    tags = {
        Name = "Private Subnet Route Table"
    }
}


