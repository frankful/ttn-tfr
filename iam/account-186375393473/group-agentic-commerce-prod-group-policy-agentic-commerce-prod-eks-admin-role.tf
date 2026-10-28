# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-group:agentic-commerce-prod-eks-admin-role"
	to = aws_iam_group_policy.group_agentic-commerce-prod-group_gixmo_agentic-commerce-prod-eks-admin-role
}

resource "aws_iam_group_policy" "group_agentic-commerce-prod-group_gixmo_agentic-commerce-prod-eks-admin-role" {
	name   = "agentic-commerce-prod-eks-admin-role"
	group   = "agentic-commerce-prod-group"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::186375393473:role/agentic-commerce-prod-eks-cluster-admin-role"
				"Sid" = "AllowAssumeEKSAdminRole"
			},
			{
				"Action" = [
					"eks:DescribeCluster",
					"eks:ListClusters"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:eks:ap-southeast-1:186375393473:cluster/agentic-commerce-prod-cluster"
				"Sid" = "AllowEKSDescribeForKubeconfig"
			}
		]
	})
}
