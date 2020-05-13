variable "aws_region" {
    description = "Region for the VPC"
    default = "eu-central-1"
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}

variable "amis" {
    description = "Amazon Linux AMIs by Region"
    default = {
        eu-central-1 = "ami-076431be05aaf8080"
    }
}
