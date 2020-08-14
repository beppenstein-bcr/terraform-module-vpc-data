
data "aws_route53_zone" "zones" {
  for_each = toset(var.r53_domains)
  name  = each.value
}