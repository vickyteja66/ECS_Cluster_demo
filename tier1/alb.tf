module "ALB" {
  source = "../Module/ALB"
  lb_name = "my-alb"
  load_balancer_type = "application"
  subnets = ["subnet-0bdbd689afc13cfe5"]// "subnet-07e0a7fbb27375c21"]
#   security_groups = "sg-0daa8f6e0ff6e8505"
}