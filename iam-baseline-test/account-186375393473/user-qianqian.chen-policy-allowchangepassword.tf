# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "qianqian.chen:AllowChangePassword"
	to = aws_iam_user_policy.user_qianqian_chen_essoe_AllowChangePassword
}

resource "aws_iam_user_policy" "user_qianqian_chen_essoe_AllowChangePassword" {
	name   = "AllowChangePassword"
	user   = "qianqian.chen"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "iam:ChangePassword"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::*:user/qianqian.chen"
			}
		]
	})
}
