resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.devops.id
  vpc_security_group_ids = [data.aws_ssm_parameter.bastian_sg_id.value]
  instance_type          = "t3.micro"
  subnet_id   = local.public_subnet
  tags = merge(
    var.commontags,
    {
        Name = "${var.project}-${var.environment}-bastion"
    }
  )
}
