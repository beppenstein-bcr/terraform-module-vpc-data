data "aws_subnet_ids" "subnet_ids" {
  vpc_id = local.vpc_id
}

data "aws_subnet" "subnets" {
  for_each = data.aws_subnet_ids.subnet_ids.ids
  id       = each.value
}

data "aws_route_tables" "rtbs" {
  vpc_id = local.vpc_id
}

data "aws_route_table" "private_subnet_routing_tables" {
  for_each = toset(concat(local.private_subnet_ids, local.private_database_subnet_ids))
  subnet_id = each.key
}

data "aws_route_table" "public_subnet_routing_tables" {
  for_each = toset(concat(local.public_subnet_ids, local.public_database_subnet_ids))
  subnet_id = each.key
}

data "aws_security_groups" "sgs" {
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
}

data "aws_security_group" "security_groups" {
  for_each = data.aws_security_groups.sgs.ids
  id = each.key
}
