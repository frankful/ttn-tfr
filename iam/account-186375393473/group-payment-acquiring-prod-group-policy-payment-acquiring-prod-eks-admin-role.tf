# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-group:payment-acquiring-prod-eks-admin-role"
	to = aws_iam_group_policy.group_payment-acquiring-prod-group_xyjbc_payment-acquiring-prod-eks-admin-role
}

resource "aws_iam_group_policy" "group_payment-acquiring-prod-group_xyjbc_payment-acquiring-prod-eks-admin-role" {
	name   = "payment-acquiring-prod-eks-admin-role"
	group   = "payment-acquiring-prod-group"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::186375393473:role/payment-acquiring-prod-eks-cluster-admin-role"
				"Sid" = "AllowAssumeEKSAdminRole"
			},
			{
				"Action" = [
					"eks:DescribeCluster",
					"eks:ListClusters"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:eks:ap-southeast-1:186375393473:cluster/payment-acquiring-prod-cluster"
				"Sid" = "AllowEKSDescribeForKubeconfig"
			}
		]
	})
}
