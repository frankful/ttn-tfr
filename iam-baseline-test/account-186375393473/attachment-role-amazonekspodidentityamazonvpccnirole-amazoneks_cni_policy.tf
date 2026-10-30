# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "AmazonEKSPodIdentityAmazonVPCCNIRole/arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
	to = aws_iam_role_policy_attachment.attachment_role_AmazonEKSPodIdentityAmazonVPCCNIRole_AmazonEKS_CNI_Policy
}

resource "aws_iam_role_policy_attachment" "attachment_role_AmazonEKSPodIdentityAmazonVPCCNIRole_AmazonEKS_CNI_Policy" {
	role       = "AmazonEKSPodIdentityAmazonVPCCNIRole"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
