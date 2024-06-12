module "target_group" {
  source = "../Module/target_group"

  target_group = "my-target-group"
  vpc_id = "vpc-039f9a61ce56f7f23"
}