# First-time adoption: import the pre-existing policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:policy/s3-tdfos-prod-connector-get"
	to = aws_iam_policy.managed_policy_s3-tdfos-prod-connector-get
}

resource "aws_iam_policy" "managed_policy_s3-tdfos-prod-connector-get" {
	name   = "s3-tdfos-prod-connector-get"
	path   = "/"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "s3:ListBucket"
				"Condition" = {
					"StringLike" = {
						"s3:prefix" = "connector/*"
					}
				}
				"Effect" = "Allow"
				"Resource" = "arn:aws:s3:::tdfos-prod"
				"Sid" = "AllowListBucketConnectorPrefix"
			},
			{
				"Action" = [
					"s3:GetObject",
					"s3:PutObject"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:s3:::tdfos-prod/connector/*"
				"Sid" = "AllowGetObjectConnector"
			}
		]
	})
}
