resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
}

resource "aws_ssm_parameter" "public_subnet" {
  name = "/${var.project}/${var.environment}/public_subnet_id"
  type = "StringList"
  value = join(",",module.vpc.public_subnet)
}

resource "aws_ssm_parameter" "private_subnet" {
  name="/${var.project}/${var.environment}/private_subnet_id"
  type="StringList"
  value = join(",",module.vpc.private_subnet)
}

resource "aws_ssm_parameter" "Database_subnet" {
  name = "/${var.project}/${var.environment}/Database_subnet_id"
  type = "StringList"
  value = join(",",module.vpc.database_subnet)
}