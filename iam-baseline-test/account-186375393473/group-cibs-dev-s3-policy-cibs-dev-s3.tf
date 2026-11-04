# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "cibs-dev-s3:cibs-dev-s3"
	to = aws_iam_group_policy.group_cibs-dev-s3_rrsll_cibs-dev-s3
}

resource "aws_iam_group_policy" "group_cibs-dev-s3_rrsll_cibs-dev-s3" {
	name   = "cibs-dev-s3"
	group   = "cibs-dev-s3"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"s3:ListBucket",
					"s3:GetBucketLocation"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::sitinnerbucket",
					"arn:aws:s3:::sitonebank"
				]
				"Sid" = "AllowBucketLocation"
			},
			{
				"Action" = [
					"s3:PutObject",
					"s3:GetObject",
					"s3:DeleteObject",
					"s3:PutObjectAcl"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::sitinnerbucket/*",
					"arn:aws:s3:::sitonebank/*"
				]
				"Sid" = "AllowBucketObjectOps"
			},
			{
				"Action" = [
					"s3:ListAllMyBuckets",
					"s3:GetBucketLocation"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowListAllBuckets"
			}
		]
	})
}
