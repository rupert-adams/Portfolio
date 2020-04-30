data "aws_acm_certificate" "cert" {
  domain   = "www.rupertadams.io"
  types    = ["AMAZON_ISSUED"]
  statuses = ["ISSUED"]
}

resource "aws_route53_zone" "main" {
  name = "rupertadams.io"
}

#resource "aws_route53_record" "www" {
#  zone_id = aws_route53_zone.main.zone_id
#  name    = "www.rupertadams.io"
#  type    = "A"
#  ttl     = "300"
#  records = [
#    var.route_records[0],
#    var.route_records[1],
#    var.route_records[2],
#    var.route_records[3],
#  ]
#}


resource "aws_route53_record" "cert_validation" {
  name    = data.aws_acm_certificate.cert.domain
  type    = "A"
  zone_id = aws_route53_zone.main.zone_id
  records = [data.aws_acm_certificate.cert.domain_validation_options.0.resource_record_value]
  ttl     = 60
}


#resource "aws_acm_certificate" "certif" {
# domain_name       = "*.${aws_route53_zone.main.name}"
#  validation_method = "DNS"

#  lifecycle {
#    create_before_destroy = true
#   }
#}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = data.aws_acm_certificate.cert.arn
  validation_record_fqdns = [aws_route53_record.cert_validation.fqdn]
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_elb.portfolio-elb.arn
  port              = 443
  protocol          = "HTTPS"
  # V Not sure about this one V
  certificate_arn   = data.aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_tg.arn
  }
}

resource "aws_lb_listener_certificate" "internet-lb-cert" {
  listener_arn    = aws_lb_listener.lb_listener.arn
  # V Not sure about this one V
  certificate_arn = data.aws_acm_certificate.cert.arn
}

resource "aws_alb_target_group" "alb_tg" {
  name     = "${var.project}-alb-tg"
  port     = 443
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
  target_type = "ip"

  health_check {
    protocol            = "HTTP"
    healthy_threshold   = 2
    interval            = 15
    path                = "/"
    timeout             = 10
    unhealthy_threshold = 2
  }
  depends_on = [aws_elb.portfolio-elb]
}