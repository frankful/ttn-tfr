# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "liam/arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
	to = aws_iam_user_policy_attachment.attachment_user_liam_AmazonEC2ContainerRegistryFullAccess
}

resource "aws_iam_user_policy_attachment" "attachment_user_liam_AmazonEC2ContainerRegistryFullAccess" {
	user       = "liam"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}
