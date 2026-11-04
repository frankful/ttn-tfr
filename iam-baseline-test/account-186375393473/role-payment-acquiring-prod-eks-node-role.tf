# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-eks-node-role"
	to = aws_iam_role.role_payment-acquiring-prod-eks-node-role
}

resource "aws_iam_role" "role_payment-acquiring-prod-eks-node-role" {
	name                 = "payment-acquiring-prod-eks-node-role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Principal" = {
					"Service" = "ec2.amazonaws.com"
				}
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
}
