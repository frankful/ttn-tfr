# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "liam/arn:aws:iam::aws:policy/AmazonS3FullAccess"
	to = aws_iam_user_policy_attachment.attachment_user_liam_AmazonS3FullAccess
}

resource "aws_iam_user_policy_attachment" "attachment_user_liam_AmazonS3FullAccess" {
	user       = "liam"
	policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
