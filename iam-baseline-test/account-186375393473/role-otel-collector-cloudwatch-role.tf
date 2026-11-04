# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "otel-collector-cloudwatch-role"
	to = aws_iam_role.role_otel-collector-cloudwatch-role
}

resource "aws_iam_role" "role_otel-collector-cloudwatch-role" {
	name                 = "otel-collector-cloudwatch-role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRoleWithWebIdentity"
				"Condition" = {
					"StringEquals" = {
						"oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021:aud" = "sts.amazonaws.com"
						"oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021:sub" = [
							"system:serviceaccount:opentelemetry:otel-collector-sa",
							"system:serviceaccount:agentic-commerce:acm-otel-collector"
						]
					}
				}
				"Effect" = "Allow"
				"Principal" = {
					"Federated" = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021"
				}
			}
		]
	})
	path                 = "/"
	description          = "IRSA role for OTEL Collector to access CloudWatch Logs"
	max_session_duration = 3600
}
