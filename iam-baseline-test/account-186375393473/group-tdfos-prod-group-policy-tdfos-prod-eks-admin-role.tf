# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "tdfos-prod-group:tdfos-prod-eks-admin-role"
	to = aws_iam_group_policy.group_tdfos-prod-group_tgmcx_tdfos-prod-eks-admin-role
}

resource "aws_iam_group_policy" "group_tdfos-prod-group_tgmcx_tdfos-prod-eks-admin-role" {
	name   = "tdfos-prod-eks-admin-role"
	group   = "tdfos-prod-group"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::186375393473:role/tdfos-prod-eks-cluster-admin-role"
				"Sid" = "AllowAssumeEKSAdminRole"
			},
			{
				"Action" = [
					"eks:DescribeCluster",
					"eks:ListClusters"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:eks:ap-southeast-1:186375393473:cluster/tdfos-prod-cluster"
				"Sid" = "AllowEKSDescribeForKubeconfig"
			}
		]
	})
}
