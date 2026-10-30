# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "iam-readonly/arn:aws:iam::aws:policy/IAMReadOnlyAccess"
	to = aws_iam_user_policy_attachment.attachment_user_iam-readonly_IAMReadOnlyAccess
}

resource "aws_iam_user_policy_attachment" "attachment_user_iam-readonly_IAMReadOnlyAccess" {
	user       = "iam-readonly"
	policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}
