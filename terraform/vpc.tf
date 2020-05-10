# default vpc
data "aws_vpc" "default" {
  default = true
}

# default subnets
resource "aws_default_subnet" "default_az1" {
  availability_zone = "${var.region}a"

  tags = {
    Name = "Default subnet for ${var.region}a"
  }
}
