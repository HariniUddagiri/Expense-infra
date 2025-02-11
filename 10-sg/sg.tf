module "mysql_sg" {
  source = "../terraform-aws-sg"
  project = var.project
  environment = var.environment
  sg_name = "mysql"
  sg_description ="Created for mysql instance of expense project"
  commontags = var.commontags
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}

module "backend_sg" {
  source = "../terraform-aws-sg"
  project = var.project
  environment = var.environment
  sg_name = "backend"
  sg_description ="Created for backend instance of expense project"
  commontags = var.commontags
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}

module "frontend_sg" {
  source = "../terraform-aws-sg"
  project = var.project
  environment = var.environment
  sg_name = "frontend"
  sg_description ="Created for frontend instance of expense project"
  commontags = var.commontags
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}

module "bastian_sg" {
  source = "../terraform-aws-sg"
  project = var.project
  environment = var.environment
  sg_name = "bastian"
  sg_description ="Created for bastian host of expense project"
  commontags = var.commontags
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}