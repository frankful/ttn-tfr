# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "xielianghai:lianghai-otel-cloudwatch-policy"
	to = aws_iam_user_policy.user_xielianghai_dzrrn_lianghai-otel-cloudwatch-policy
}

resource "aws_iam_user_policy" "user_xielianghai_dzrrn_lianghai-otel-cloudwatch-policy" {
	name   = "lianghai-otel-cloudwatch-policy"
	user   = "xielianghai"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"iam:ListPolicies"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			},
			{
				"Action" = [
					"access-analyzer:ListPolicyGenerations"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			}
		]
	})
}
