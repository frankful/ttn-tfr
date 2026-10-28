# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "MyTestEKSNodeRole/arn:aws:iam::186375393473:policy/Opentelemetry-EKS-Nodes"
	to = aws_iam_role_policy_attachment.attachment_role_MyTestEKSNodeRole_Opentelemetry-EKS-Nodes
}

resource "aws_iam_role_policy_attachment" "attachment_role_MyTestEKSNodeRole_Opentelemetry-EKS-Nodes" {
	role       = "MyTestEKSNodeRole"
	policy_arn = "arn:aws:iam::186375393473:policy/Opentelemetry-EKS-Nodes"
}
