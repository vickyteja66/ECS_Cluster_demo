variable "fargate_name" {
  type = string
}

variable "subnet_id1" {
    type = string
}

variable "subnet_id2" {
    type = string
}

variable "security_groups" {
    type = string
}

variable "container_name" {
  type = string
}

resource "aws_ecs_service" "fargate_service" {
  name            = var.fargate_name
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = ["var.subnet_id1", "var.subnet_id2"] // Specify your subnet IDs for Fargate
    security_groups = ["var.security_groups"] // Specify your security group IDs for Fargate
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.my_target_group.arn
    container_name   = var.container_name
    container_port   = 80
  }
}