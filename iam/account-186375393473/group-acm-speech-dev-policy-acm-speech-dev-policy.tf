# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "acm-speech-dev:acm-speech-dev-policy"
	to = aws_iam_group_policy.group_acm-speech-dev_fwaiq_acm-speech-dev-policy
}

resource "aws_iam_group_policy" "group_acm-speech-dev_fwaiq_acm-speech-dev-policy" {
	name   = "acm-speech-dev-policy"
	group   = "acm-speech-dev"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"s3:ListAllMyBuckets",
					"s3:GetBucketLocation"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::*"
				]
				"Sid" = "AllowStatement1"
			},
			{
				"Action" = [
					"s3:ListBucket"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::acm-speech-dev"
				]
				"Sid" = "AllowListGitLabBakBucket"
			},
			{
				"Action" = [
					"s3:*"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::acm-speech-dev/*"
				]
				"Sid" = "AllowFullAccessToGitLabBakObjects"
			}
		]
	})
}
