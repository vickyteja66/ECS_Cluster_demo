variable "cluster_name" {
  type = string
}

resource "aws_ecs_cluster" "my_cluster" {
  name = var.cluster_name
}