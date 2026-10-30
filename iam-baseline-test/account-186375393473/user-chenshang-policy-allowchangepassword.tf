# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "chenshang:AllowChangePassword"
	to = aws_iam_user_policy.user_chenshang_essoe_AllowChangePassword
}

resource "aws_iam_user_policy" "user_chenshang_essoe_AllowChangePassword" {
	name   = "AllowChangePassword"
	user   = "chenshang"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "iam:ChangePassword"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::*:user/chenshang"
			}
		]
	})
}
