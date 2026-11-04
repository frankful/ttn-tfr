# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "bingjie.chen:AllowChangePassword"
	to = aws_iam_user_policy.user_bingjie_chen_essoe_AllowChangePassword
}

resource "aws_iam_user_policy" "user_bingjie_chen_essoe_AllowChangePassword" {
	name   = "AllowChangePassword"
	user   = "bingjie.chen"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "iam:ChangePassword"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::*:user/bingjie.chen"
			}
		]
	})
}
