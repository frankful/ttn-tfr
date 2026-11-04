# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "tudi.liang:AllowChangePassword"
	to = aws_iam_user_policy.user_tudi_liang_essoe_AllowChangePassword
}

resource "aws_iam_user_policy" "user_tudi_liang_essoe_AllowChangePassword" {
	name   = "AllowChangePassword"
	user   = "tudi.liang"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "iam:ChangePassword"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::*:user/tudi.liang"
			}
		]
	})
}
