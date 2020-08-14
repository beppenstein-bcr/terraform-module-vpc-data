output "vpc_id" {
  value = local.vpc_id
  description = "VPC ID"
  sensitive = true
}

output "vpc" {
  value = data.aws_vpc.this
  description = <<EOF
    Type: Map - A map of vpc data [Terraform Doc](https://www.terraform.io/docs/providers/aws/d/vpc.html)
  EOF
  sensitive = true
}

output "vpc_cidr_block" {
  value = data.aws_vpc.this.cidr_block
  description = "The VPC CIDR block"
  sensitive = true
}

output "private_subnet_ids" {
  value = local.private_subnet_ids
  description = <<EOF
    This is a set(string) which can be used of for_each loops on resources
    To use these as a list you must convert from type set to type list with tolist()
  EOF
  sensitive = true
}

output "public_subnet_ids" {
  value = local.public_subnet_ids
  description = <<EOF
    This is a set(string) which can be used of for_each loops on resources
    To use these as a list you must convert from type set to type list with tolist()
  EOF
  sensitive = true
}

output "private_database_subnet_ids" {
  value = local.private_database_subnet_ids
  description = <<EOF
    This is a set(string) which can be used of for_each loops on resources
    To use these as a list you must convert from type set to type list with tolist()
  EOF
  sensitive = true
}

output "public_database_subnet_ids" {
  value = local.public_database_subnet_ids
  description = <<EOF
    This is a set(string) which can be used of for_each loops on resources
    To use these as a list you must convert from type set to type list with tolist()
  EOF
  sensitive = true
}

output "vpc_subnets" {
  value = data.aws_subnet.subnets
  description = <<EOF
    Type: Map of Maps - A map of all subnet data [Terraform Doc](https://www.terraform.io/docs/providers/aws/d/subnet.html)
  EOF
  sensitive = true
}

output "route_table_ids" {
  value = local.rtb_ids
  description = <<EOF
    This is a set(string) which can be used of for_each loops on resources
    To use these as a list you must convert from type set to type list with tolist()
  EOF
  sensitive = true
}

output "private_route_tables" {
  value = data.aws_route_table.private_subnet_routing_tables
  description = <<EOF
    Type: Map of Maps - A map of all private route_table data [Terraform Doc](https://www.terraform.io/docs/providers/aws/d/route_table.html)
  EOF
  sensitive = true
}

output "private_route_table_ids" {
  value = local.private_route_table_ids
  description = <<EOF
    This is a set(string) which can be used of for_each loops on resources
    To use these as a list you must convert from type set to type list with tolist()
  EOF
  sensitive = true
}

output "public_route_table_ids" {
  value = local.public_route_table_ids
  description = <<EOF
    This is a set(string) which can be used of for_each loops on resources
    To use these as a list you must convert from type set to type list with tolist()
  EOF
  sensitive = true
}

output "public_route_tables" {
  value = data.aws_route_table.public_subnet_routing_tables
  description = <<EOF
    Type: Map of Maps - A map of all public route_table data [Terraform Doc](https://www.terraform.io/docs/providers/aws/d/route_table.html)
  EOF
  sensitive = true
}

output "security_group_ids" {
  value = data.aws_security_groups.sgs.ids
  description = <<EOF
    This is a set(string) which can be used of for_each loops on resources
    To use these as a list you must convert from type set to type list with tolist()
  EOF
  sensitive = true
}

output "security_groups" {
  value = data.aws_security_group.security_groups
  description = <<EOF
    Type: Map of Maps - A map of all public route_table data [Terraform Doc](https://www.terraform.io/docs/providers/aws/d/security_group.html)
  EOF
  sensitive = true
}

output "azl2_ami_id" {
  value = data.aws_ami.amazon_linux_2.id
  description = "The latest Amazon Linux2 AMI ID"
  sensitive = true
}

output "route53_zone_id" {
  value = data.aws_route53_zone.zones
  sensitive = true
}

output "buckets" {
  value = data.aws_s3_bucket_object.buckets
  sensitive = true
}