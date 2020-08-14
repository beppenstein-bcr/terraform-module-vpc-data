
data "aws_route53_zone" "zone" {
  name         = var.r53_domain
}