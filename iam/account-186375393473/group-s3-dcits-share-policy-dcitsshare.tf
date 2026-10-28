# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "s3-dcits-share:dcitsshare"
	to = aws_iam_group_policy.group_s3-dcits-share_spwfs_dcitsshare
}

resource "aws_iam_group_policy" "group_s3-dcits-share_spwfs_dcitsshare" {
	name   = "dcitsshare"
	group   = "s3-dcits-share"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"s3:*",
					"s3-object-lambda:*"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::dcits-share",
					"arn:aws:s3:::dcits-share/*"
				]
			}
		]
	})
}
