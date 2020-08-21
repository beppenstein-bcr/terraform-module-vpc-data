data "aws_acm_certificate" "certs" {
  for_each = toset(var.r53_domains)
  domain = each.key
}