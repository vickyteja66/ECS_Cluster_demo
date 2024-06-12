variable "ec2_service" {
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
variable "security_groups" {
    type = string
    default = "sg-0daa8f6e0ff6e8505"
}

variable "container_name" {
    type = string
}

resource "aws_ecs_service" "ec2_service" {
  name            = var.ec2_service
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  desired_count   = 1
  launch_type     = "EC2"

  network_configuration {
    subnets         = ["var.subnet_id1", "var.subnet_id2"] // Specify your subnet IDs for EC2
    security_groups = ["var.security_groups"] // Specify your security group IDs for EC2
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.my_target_group.arn
    container_name   = var.container_name
    container_port   = 80
  }
}