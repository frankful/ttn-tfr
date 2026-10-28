# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "otel-collector-cloudwatch-role:CloudWatchLogsAccess"
	to = aws_iam_role_policy.role_otel-collector-cloudwatch-role_bnxpn_policy
}

resource "aws_iam_role_policy" "role_otel-collector-cloudwatch-role_bnxpn_policy" {
	name   = "CloudWatchLogsAccess"
	role   = "otel-collector-cloudwatch-role"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"logs:PutLogEvents",
					"logs:CreateLogGroup",
					"logs:CreateLogStream",
					"logs:DescribeLogStreams",
					"logs:DescribeLogGroups"
				]
				"Effect" = "Allow"
				"Resource" = "*"
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
