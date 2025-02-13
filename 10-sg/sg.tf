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

module "aws_alb_sg" {
  source = "../terraform-aws-sg"
  project = var.project
  environment = var.environment
  sg_name = "app-alb"
  sg_description ="Created for alb  of expense project"
  commontags = var.commontags
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}

resource "aws_security_group_rule" "app_alb_bastion" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  source_security_group_id = module.bastian_sg.aws_security_group
  security_group_id =module.aws_alb_sg.aws_security_group
}

resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastian_sg.aws_security_group
}