# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-eks-cluster-admin-role"
	to = aws_iam_role.role_agentic-commerce-prod-eks-cluster-admin-role
}

resource "aws_iam_role" "role_agentic-commerce-prod-eks-cluster-admin-role" {
	name                 = "agentic-commerce-prod-eks-cluster-admin-role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Principal" = {
					"AWS" = "arn:aws:iam::186375393473:root"
				}
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
	tags                 = {
		"Environment" = "tac-prd"
		"Project" = "agentic-commerce-prod"
		"RoleType" = "agentic-commerce-prod-EKS-Cluster-Admin"
	}
}
