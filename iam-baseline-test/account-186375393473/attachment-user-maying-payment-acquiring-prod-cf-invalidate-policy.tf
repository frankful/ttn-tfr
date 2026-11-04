# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "maying/arn:aws:iam::186375393473:policy/payment-acquiring-prod-cf-invalidate-policy"
	to = aws_iam_user_policy_attachment.attachment_user_maying_payment-acquiring-prod-cf-invalidate-policy
}

resource "aws_iam_user_policy_attachment" "attachment_user_maying_payment-acquiring-prod-cf-invalidate-policy" {
	user       = "maying"
	policy_arn = "arn:aws:iam::186375393473:policy/payment-acquiring-prod-cf-invalidate-policy"
}
