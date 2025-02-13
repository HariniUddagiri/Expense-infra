locals {
    #Stringlist to list
  private_subnet_id= split(",",data.aws_ssm_parameter.private_subnet.value)
  app_alb_sg_id=data.aws_ssm_parameter.alb_sg.value
}