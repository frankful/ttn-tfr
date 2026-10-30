# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-eks-cluster-role"
	to = aws_iam_role.role_agentic-commerce-prod-eks-cluster-role
}

resource "aws_iam_role" "role_agentic-commerce-prod-eks-cluster-role" {
	name                 = "agentic-commerce-prod-eks-cluster-role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Principal" = {
					"Service" = "eks.amazonaws.com"
				}
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
}
