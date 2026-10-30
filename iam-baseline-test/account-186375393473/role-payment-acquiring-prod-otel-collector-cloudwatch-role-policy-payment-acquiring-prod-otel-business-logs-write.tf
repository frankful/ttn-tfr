# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-otel-collector-cloudwatch-role:payment-acquiring-prod-otel-business-logs-write"
	to = aws_iam_role_policy.role_payment-acquiring-prod-otel-collector-cloudwatch-role_mipcx_policy
}

resource "aws_iam_role_policy" "role_payment-acquiring-prod-otel-collector-cloudwatch-role_mipcx_policy" {
	name   = "payment-acquiring-prod-otel-business-logs-write"
	role   = "payment-acquiring-prod-otel-collector-cloudwatch-role"
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
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/logs",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/logs:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/metrics",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/metrics:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/aws/payment-acquiring-prod/eks",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/aws/payment-acquiring-prod/eks:*"
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
