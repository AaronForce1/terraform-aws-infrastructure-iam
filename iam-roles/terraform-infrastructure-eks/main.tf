resource "aws_iam_role" "infrastructure_terraform_eks_service_role" {
  name = "infrastructure_terraform_eks_serviceaccount"
  path = "/serviceaccounts/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${var.allowed_users}"
      },
      "Action": "sts:AssumeRole"
    },
  ]
}
EOF
  force_detach_policies = true

  tags = {
    group           = "Infra-Terraform-EKS"
    billingcustomer = var.billingcustomer
  }
}

resource "aws_iam_role_policy_attachment" "terraform_eks_rolepolicy-attach" {
  role       = aws_iam_role.infrastructure_terraform_eks_service_role.name
  policy_arn = aws_iam_policy.terraform_eks_policy.arn
}

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.allowed_users
    }
  }
}