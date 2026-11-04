# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "otel-acm-prd-cloudwatch-role:otel-acm-prd-cloudwatch-rolePolicy"
	to = aws_iam_role_policy.role_otel-acm-prd-cloudwatch-role_lvdmg_policy
}

resource "aws_iam_role_policy" "role_otel-acm-prd-cloudwatch-role_lvdmg_policy" {
	name   = "otel-acm-prd-cloudwatch-rolePolicy"
	role   = "otel-acm-prd-cloudwatch-role"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"logs:PutLogEvents",
					"logs:CreateLogStream",
					"logs:DescribeLogStreams",
					"logs:DescribeLogGroups"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/app",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/app:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/metrics",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/metrics:*"
				]
			},
			{
				"Action" = [
					"xray:PutTraceSegments",
					"xray:PutTelemetryRecords"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			},
			{
				"Action" = [
					"ec2:DescribeTags",
					"ec2:DescribeInstances",
					"ec2:DescribeVolumes"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			}
		]
	})
}
