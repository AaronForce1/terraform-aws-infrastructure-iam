resource "aws_route53_zone" "primary_dev_zone" {
  name = var.client_root_domain_name
}