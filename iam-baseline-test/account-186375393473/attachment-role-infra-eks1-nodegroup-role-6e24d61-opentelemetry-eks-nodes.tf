# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "infra-eks1-nodegroup-role-6e24d61/arn:aws:iam::186375393473:policy/Opentelemetry-EKS-Nodes"
	to = aws_iam_role_policy_attachment.attachment_role_infra-eks1-nodegroup-role-6e24d61_Opentelemetry-EKS-Nodes
}

resource "aws_iam_role_policy_attachment" "attachment_role_infra-eks1-nodegroup-role-6e24d61_Opentelemetry-EKS-Nodes" {
	role       = "infra-eks1-nodegroup-role-6e24d61"
	policy_arn = "arn:aws:iam::186375393473:policy/Opentelemetry-EKS-Nodes"
}
