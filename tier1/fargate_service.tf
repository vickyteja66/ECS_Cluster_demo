module "fargate_service" {
  source = "../Module/ECS_fargate_service"

  fargate_name = "fargate-service"
  subnet_id1 = "subnet-0bdbd689afc13cfe5"
  subnet_id2 = "subnet-07e0a7fbb27375c21"
  security_groups = "sg-0daa8f6e0ff6e8505"
  container_name = "my-container"
}