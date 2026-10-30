# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "weiliang:AllowUserChangeOwnPassword"
	to = aws_iam_user_policy.user_weiliang_lfjnj_AllowUserChangeOwnPassword
}

resource "aws_iam_user_policy" "user_weiliang_lfjnj_AllowUserChangeOwnPassword" {
	name   = "AllowUserChangeOwnPassword"
	user   = "weiliang"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "iam:ChangePassword"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::*:user/$${aws:username}"
			}
		]
	})
}
