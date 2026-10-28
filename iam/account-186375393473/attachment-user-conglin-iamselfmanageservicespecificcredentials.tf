# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "conglin/arn:aws:iam::aws:policy/IAMSelfManageServiceSpecificCredentials"
	to = aws_iam_user_policy_attachment.attachment_user_conglin_IAMSelfManageServiceSpecificCredentials
}

resource "aws_iam_user_policy_attachment" "attachment_user_conglin_IAMSelfManageServiceSpecificCredentials" {
	user       = "conglin"
	policy_arn = "arn:aws:iam::aws:policy/IAMSelfManageServiceSpecificCredentials"
}
