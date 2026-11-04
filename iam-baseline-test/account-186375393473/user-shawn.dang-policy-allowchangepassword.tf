# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "shawn.dang:AllowChangePassword"
	to = aws_iam_user_policy.user_shawn_dang_essoe_AllowChangePassword
}

resource "aws_iam_user_policy" "user_shawn_dang_essoe_AllowChangePassword" {
	name   = "AllowChangePassword"
	user   = "shawn.dang"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "iam:ChangePassword"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::*:user/shawn.dang"
			}
		]
	})
}
