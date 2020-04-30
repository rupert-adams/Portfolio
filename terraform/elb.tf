resource "aws_elb" "portfolio-elb" {
  name = "portfolio-elb"
  subnets = [data.aws_default_subnet.default_az1]
  listener {
    instance_port = 8000
    instance_protocol = "https"
    lb_port = 443
    lb_protocol = "https"
    ssl_certificate_id = data.aws_acm_certificate.cert.arn
  }
  health_check {
    healthy_threshold = 2
    interval = 30
    target = "HTTPS:443/"
    timeout = 3
    unhealthy_threshold = 2
  }
  connection_draining = true
  connection_draining_timeout = 400
}

data "aws_default_subnet" "default_az1" {
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Default subnet for eu-west-1a"
  }
}