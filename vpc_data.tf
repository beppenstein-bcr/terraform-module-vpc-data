data "aws_vpcs" "vpcs" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_vpc" "this" {
  id = local.vpc_id
}

