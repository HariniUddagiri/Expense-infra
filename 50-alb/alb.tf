module "alb" {
  source = "terraform-aws-modules/alb/aws"

  name    = "expense-dev-alb"
  vpc_id  = data.aws_ssm_parameter.vpc_id.value
  subnets = local.private_subnet_id
  internal = true #says it is for private subnet
  create_security_group = false #we don't security grp from open source module
  security_groups = [local.app_alb_sg_id]
  enable_deletion_protection = false

  
  tags = merge(var.commontags, {
    Name="${var.project}/${var.environment}-app-alb"
  })
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = module.alb.arn
  port              = "80"
  protocol          = "HTTP"
  

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>I am becakend app-alb listener<h1>"
      status_code  = "200"
    }
  }
}
resource "aws_route53_record" "app_alb" {
  zone_id = var.zone_id
  name    = "*.app-dev.${var.domain_name}"
  type    = "A"

  # these are ALB DNS name and zone information
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = false
  }
}
