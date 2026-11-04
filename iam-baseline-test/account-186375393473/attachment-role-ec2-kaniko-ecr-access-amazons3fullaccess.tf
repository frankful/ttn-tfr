# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "ec2-kaniko-ecr-access/arn:aws:iam::aws:policy/AmazonS3FullAccess"
	to = aws_iam_role_policy_attachment.attachment_role_ec2-kaniko-ecr-access_AmazonS3FullAccess
}

resource "aws_iam_role_policy_attachment" "attachment_role_ec2-kaniko-ecr-access_AmazonS3FullAccess" {
	role       = "ec2-kaniko-ecr-access"
	policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
