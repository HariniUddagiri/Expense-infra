locals {
  public_subnet=split(",",data.aws_ssm_parameter.public_subnet_id.value)[0]
}