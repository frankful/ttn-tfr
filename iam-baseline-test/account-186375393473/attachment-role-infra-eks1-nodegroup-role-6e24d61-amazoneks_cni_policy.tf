# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "infra-eks1-nodegroup-role-6e24d61/arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
	to = aws_iam_role_policy_attachment.attachment_role_infra-eks1-nodegroup-role-6e24d61_AmazonEKS_CNI_Policy
}

resource "aws_iam_role_policy_attachment" "attachment_role_infra-eks1-nodegroup-role-6e24d61_AmazonEKS_CNI_Policy" {
	role       = "infra-eks1-nodegroup-role-6e24d61"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
