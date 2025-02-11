data "aws_ami" "devops" {
    most_recent      = true
    owners           = ["973714476881"]
    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}


data "aws_ssm_parameter" "public_subnet_id" {
  name="/${var.project}/${var.environment}/security_grp_id"
}

data "aws_ssm_parameter" "bastian_sg_id" {
  name="/${var.project}/${var.environment}/bastian_security_grp_id"
}