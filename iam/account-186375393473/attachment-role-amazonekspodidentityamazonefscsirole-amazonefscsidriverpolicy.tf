# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "AmazonEKSPodIdentityAmazonEFSCSIRole/arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_AmazonEKSPodIdentityAmazonEFSCSIRole_service-role_AmazonEFSCSIDriverPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_AmazonEKSPodIdentityAmazonEFSCSIRole_service-role_AmazonEFSCSIDriverPolicy" {
	role       = "AmazonEKSPodIdentityAmazonEFSCSIRole"
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
}
