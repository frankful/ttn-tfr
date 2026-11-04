# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "wurong/arn:aws:iam::aws:policy/IAMUserChangePassword"
	to = aws_iam_user_policy_attachment.attachment_user_wurong_IAMUserChangePassword
}

resource "aws_iam_user_policy_attachment" "attachment_user_wurong_IAMUserChangePassword" {
	user       = "wurong"
	policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}
