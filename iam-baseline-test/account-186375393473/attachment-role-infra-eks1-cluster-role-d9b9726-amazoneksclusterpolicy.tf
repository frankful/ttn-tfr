# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "infra-eks1-cluster-role-d9b9726/arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_infra-eks1-cluster-role-d9b9726_AmazonEKSClusterPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_infra-eks1-cluster-role-d9b9726_AmazonEKSClusterPolicy" {
	role       = "infra-eks1-cluster-role-d9b9726"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
