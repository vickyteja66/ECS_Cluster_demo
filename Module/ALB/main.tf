variable "lb_name" {
  type = string
}

variable "load_balancer_type" {
  type = string
}

variable "subnet_id1" {
  type = string
  default = "subnet-0bdbd689afc13cfe5"
}

variable "subnet_id2" {
  type = string
  default = "subnet-07e0a7fbb27375c21"
}
variable "subnets" {
  type = string
}
variable "security_groups" {
  type = string
  default = "sg-0daa8f6e0ff6e8505"
}


resource "aws_lb" "my_alb" {
  name               = var.lb_name
  load_balancer_type = var.load_balancer_type
  subnets            = ["var.subnet_id1"]//, "var.subnet_id2"] // Specify your subnet IDs
  security_groups    = "var.security_groups"// Specify your security group IDs
}