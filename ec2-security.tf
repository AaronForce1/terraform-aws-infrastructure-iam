resource "aws_security_group" "default_admin_sg" {
  name        = "infra-default-admin-sg"
  description = "Default Security Group allowing Admin SSH access only"

  ingress {
    description = "Default SSH Allowed Cidrs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.default_admin_cidrs
  }

  # Outbound rules are only supported for VPC security groups
  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  tags = {
    Name = "infra-default-admin-sg"
    billingcustomer = var.billingcustomer
  }
}