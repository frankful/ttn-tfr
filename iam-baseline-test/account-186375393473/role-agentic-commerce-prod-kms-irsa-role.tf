# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-kms-irsa-role"
	to = aws_iam_role.role_agentic-commerce-prod-kms-irsa-role
}

resource "aws_iam_role" "role_agentic-commerce-prod-kms-irsa-role" {
	name                 = "agentic-commerce-prod-kms-irsa-role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRoleWithWebIdentity"
				"Condition" = {
					"StringEquals" = {
						"https://oidc.eks.ap-southeast-1.amazonaws.com/id/931EFD92F732AAAE7F9FB24C49BDAC11:sub" = [
							"system:serviceaccount:acm:acm-callback",
							"system:serviceaccount:acm:acm-enrollment",
							"system:serviceaccount:acm:acm-commerce-core",
							"system:serviceaccount:tac:tac-callback",
							"system:serviceaccount:tac:tac-enrollment",
							"system:serviceaccount:tac:tac-commerce-core"
						]
					}
				}
				"Effect" = "Allow"
				"Principal" = {
					"Federated" = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/931EFD92F732AAAE7F9FB24C49BDAC11"
				}
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
}
