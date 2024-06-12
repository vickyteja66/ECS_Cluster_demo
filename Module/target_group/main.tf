variable "target_group" {
  type = string
}

variable "vpc_id" {
  type = string
}

resource "aws_lb_target_group" "my_target_group" {
  name     = var.target_group
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id // Specify your VPC ID
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"
  # depends_on        = aws_lb.my_alb.name

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

