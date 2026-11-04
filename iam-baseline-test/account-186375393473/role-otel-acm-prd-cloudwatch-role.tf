# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "otel-acm-prd-cloudwatch-role"
	to = aws_iam_role.role_otel-acm-prd-cloudwatch-role
}

resource "aws_iam_role" "role_otel-acm-prd-cloudwatch-role" {
	name                 = "otel-acm-prd-cloudwatch-role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRoleWithWebIdentity"
				"Condition" = {
					"StringEquals" = {
						"oidc.eks.ap-southeast-1.amazonaws.com/id/931EFD92F732AAAE7F9FB24C49BDAC11:aud" = "sts.amazonaws.com"
						"oidc.eks.ap-southeast-1.amazonaws.com/id/931EFD92F732AAAE7F9FB24C49BDAC11:sub" = "system:serviceaccount:tac:tac-otel-collector"
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
	tags                 = {
		"Environtment" = "tac-prd"
	}
}
