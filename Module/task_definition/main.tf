variable "family_name" {
  type = string
}
resource "aws_ecs_task_definition" "my_task" {
  family                   = var.family_name
  container_definitions    = <<EOF
[
  {
    "name": "my-container",
    "image": "nginx",
    "cpu": 256,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
EOF
}