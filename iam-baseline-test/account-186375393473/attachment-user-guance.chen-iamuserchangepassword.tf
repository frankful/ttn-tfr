# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "guance.chen/arn:aws:iam::aws:policy/IAMUserChangePassword"
	to = aws_iam_user_policy_attachment.attachment_user_guance_chen_IAMUserChangePassword
}

resource "aws_iam_user_policy_attachment" "attachment_user_guance_chen_IAMUserChangePassword" {
	user       = "guance.chen"
	policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}
