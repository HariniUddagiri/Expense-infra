resource "aws_ssm_parameter" "security_grp_id" {
  name  = "/${var.project}/${var.environment}/security_grp_id"
  type  = "String"
  value = module.mysql_sg.aws_security_group
}

resource "aws_ssm_parameter" "backend_security_grp_id" {
  name  = "/${var.project}/${var.environment}/backend_security_grp_id"
  type  = "String"
  value = module.backend_sg.aws_security_group
}

resource "aws_ssm_parameter" "frontend_security_grp_id" {
  name  = "/${var.project}/${var.environment}/frontend_security_grp_id"
  type  = "String"
  value = module.frontend_sg.aws_security_group
}

resource "aws_ssm_parameter" "bastian_security_grp_id" {
  name  = "/${var.project}/${var.environment}/bastian_security_grp_id"
  type  = "String"
  value = module.bastian_sg.aws_security_group
}