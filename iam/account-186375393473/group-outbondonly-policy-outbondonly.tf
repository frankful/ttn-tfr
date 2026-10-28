# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "outbondonly:outbondonly"
	to = aws_iam_group_policy.group_outbondonly_pvclr_outbondonly
}

resource "aws_iam_group_policy" "group_outbondonly_pvclr_outbondonly" {
	name   = "outbondonly"
	group   = "outbondonly"
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
					"s3:*"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::temporary-outbound",
					"arn:aws:s3:::temporary-outbound/*"
				]
				"Sid" = "AllowStatement4A"
			}
		]
	})
}
