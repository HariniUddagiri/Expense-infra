resource "aws_instance" "bastion" {
  ami           = data.aws_ami.devops.id  #"ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastian_sg_id.value]
  subnet_id = local.public_subnet
  tags = merge(var.commontags, {
    Nmae="${var.project}-${var.environment}-bastian"
  })
}

