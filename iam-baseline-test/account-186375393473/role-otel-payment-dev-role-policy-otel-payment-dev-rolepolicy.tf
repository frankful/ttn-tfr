# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "otel-payment-dev-role:otel-payment-dev-rolePolicy"
	to = aws_iam_role_policy.role_otel-payment-dev-role_ljmlr_policy
}

resource "aws_iam_role_policy" "role_otel-payment-dev-role_ljmlr_policy" {
	name   = "otel-payment-dev-rolePolicy"
	role   = "otel-payment-dev-role"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"logs:CreateLogStream",
					"logs:PutLogEvents",
					"logs:DescribeLogStreams",
					"logs:DescribeLogGroups"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-dev/logs",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-dev/logs:*"
				]
				"Sid" = "AllowWriteOnlyBusinessLogGroups"
			},
			{
				"Action" = [
					"xray:PutTraceSegments",
					"xray:PutTelemetryRecords",
					"xray:GetSamplingRules",
					"xray:GetSamplingTargets"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowWriteXRay"
			}
		]
	})
}
