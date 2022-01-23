resource "aws_key_pair" "default_aws_key_pair" {
  key_name   = "DEFAULT-env-${var.aws_region}-key"
  public_key = var.
}