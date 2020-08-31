variable "transit_gateways" {
  type = map
  default = {}

}


data "aws_ec2_transit_gateway" "tgws" {
  for_each = var.transit_gateways
  filter {
    name = lookup(each.value, "filter_name", null)
    values = lookup(each.value, "values", null)
  }
}

data "aws_ec2_transit_gateway_route_table" "tgw_rtbs" {
  for_each = data.aws_ec2_transit_gateway.tgws
  id = each.value["id"]
}

