# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "tdfos-prod-eks-node-role/arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
	to = aws_iam_role_policy_attachment.attachment_role_tdfos-prod-eks-node-role_AmazonEC2ContainerRegistryReadOnly
}

resource "aws_iam_role_policy_attachment" "attachment_role_tdfos-prod-eks-node-role_AmazonEC2ContainerRegistryReadOnly" {
	role       = "tdfos-prod-eks-node-role"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
