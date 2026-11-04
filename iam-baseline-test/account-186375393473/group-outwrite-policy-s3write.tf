# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "outwrite:S3write"
	to = aws_iam_group_policy.group_outwrite_dahmc_S3write
}

resource "aws_iam_group_policy" "group_outwrite_dahmc_S3write" {
	name   = "S3write"
	group   = "outwrite"
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
				"Condition" = {
					"StringEquals" = {
						"s3:delimiter" = [
							"/"
						]
						"s3:prefix" = [
							"",
							"test/"
						]
					}
				}
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::tech-business"
				]
				"Sid" = "AllowStatement2A"
			},
			{
				"Action" = [
					"s3:ListBucket"
				]
				"Condition" = {
					"StringLike" = {
						"s3:prefix" = [
							"test/*"
						]
					}
				}
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::tech-business"
				]
				"Sid" = "AllowStatement3"
			},
			{
				"Action" = [
					"s3:*"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::tech-business/*"
				]
				"Sid" = "AllowStatement4A"
			}
		]
	})
}
