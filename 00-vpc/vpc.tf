module "vpc" {
  source = "git::https://github.com/HariniUddagiri/Terraform/tree/main/terraform-aws_vpc.git?ref=main"
  project = var.project
  environment = var.environment
  commontags = var.commontags
  vpc_tags = var.vpc_tags
  public_subnet = var.public_subnet
  private_subnet_cidr = var.private_subnet_cidr
  Database_cidr = var.Database_cidr
  is_peering= true

}