# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "s3-dcits-software:s3-dcits-software-policy"
	to = aws_iam_group_policy.group_s3-dcits-software_pkcmg_s3-dcits-software-policy
}

resource "aws_iam_group_policy" "group_s3-dcits-software_pkcmg_s3-dcits-software-policy" {
	name   = "s3-dcits-software-policy"
	group   = "s3-dcits-software"
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
					"arn:aws:s3:::dcits-software",
					"arn:aws:s3:::dcits-software/*"
				]
			}
		]
	})
}
