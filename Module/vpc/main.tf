variable "vpc_id" {
  type = string
  default = "vpc-039f9a61ce56f7f23"
}

variable "subnet_id1" {
  type = string
  default = "subnet-0bdbd689afc13cfe5"
}

variable "subnet_id2" {
  type = string
  default = "subnet-07e0a7fbb27375c21"
}

data "aws_vpc" "main" {
    id = var.vpc_id
}

data "subnet" "subnet1" {
    subnet_id = var.subnet_id1
}

data "subnet" "subnet2" {
    subnet_id = var.subnet_id2
}