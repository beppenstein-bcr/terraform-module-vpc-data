locals {
  vpc_id = element(tolist(data.aws_vpcs.vpcs.ids), 0)

  private_subnet_ids = [
    for s in data.aws_subnet.subnets : s.id
          if !s.map_public_ip_on_launch && length(regexall(var.private_subnet_regex, s.tags["Name"])) > 0
  ]

  public_subnet_ids = [
    for s in data.aws_subnet.subnets : s.id
          if s.map_public_ip_on_launch && length(regexall(var.public_subnet_regex, s.tags["Name"])) > 0
  ]

  private_database_subnet_ids = [
    for s in data.aws_subnet.subnets : s.id
          if length(regexall(var.db_subnet_regex, s.tags["Name"])) > 0 && !s.map_public_ip_on_launch
  ]

  public_database_subnet_ids = [
    for s in data.aws_subnet.subnets : s.id
          if length(regexall(var.db_subnet_regex, s.tags["Name"])) > 0 && s.map_public_ip_on_launch
  ]

  rtb_ids = data.aws_route_tables.rtbs.ids

  private_route_table_ids = toset([
    for s in data.aws_route_table.private_subnet_routing_tables : s.id
  ])

  public_route_table_ids = toset([
    for s in data.aws_route_table.public_subnet_routing_tables : s.id
  ])

  private_cidr_blocks = toset([
    for s in data.aws_subnet.subnets : s.cidr_block
      if !s.map_public_ip_on_launch && length(regexall(var.private_subnet_regex, s.tags["Name"])) > 0
          ]
  )

  public_cidr_blocks = toset([
    for s in data.aws_subnet.subnets : s.cidr_block
      if s.map_public_ip_on_launch || length(regexall(var.public_subnet_regex, s.tags["Name"])) > 0
    ]
  )

}