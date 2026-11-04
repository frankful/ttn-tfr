# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "dk-loadtest:dk-loadtest-policy"
	to = aws_iam_group_policy.group_dk-loadtest_dnudo_dk-loadtest-policy
}

resource "aws_iam_group_policy" "group_dk-loadtest_dnudo_dk-loadtest-policy" {
	name   = "dk-loadtest-policy"
	group   = "dk-loadtest"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"s3:ListBucket",
					"s3:GetObject",
					"s3:PutObject",
					"s3:PutObjectAcl"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::dcits-software",
					"arn:aws:s3:::dcits-software/tmp/*"
				]
				"Sid" = "AllowAccountAWriteToCDir"
			}
		]
	})
}
