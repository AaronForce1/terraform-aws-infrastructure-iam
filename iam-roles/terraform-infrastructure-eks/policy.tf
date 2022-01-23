resource "aws_iam_policy" "terraform_eks_policy" {
    name = "terraform_eks_policy"
    path = "/serviceaccounts/"
    policy = data.aws_iam_policy_document.terraform_eks_policy.json
}

data "aws_iam_policy_document" "terraform_eks_policy" {
    statement {
        sid = "1"
        actions = [
            "tag:TagResources",
            "tag:GetResources",
            "route53:*",
            "logs:*",
            "iam:*",
            "elasticloadbalancing:*",
            "eks:*",
            "ec2:*",
            "cloudwatch:*",
            "acm:*",
            "kms:*"
        ]
        resources = [
            "*",
        ]
    }
}