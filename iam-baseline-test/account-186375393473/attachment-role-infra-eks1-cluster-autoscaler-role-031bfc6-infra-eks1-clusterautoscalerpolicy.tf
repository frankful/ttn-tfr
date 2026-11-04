# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "infra-eks1-cluster-autoscaler-role-031bfc6/arn:aws:iam::186375393473:policy/infra-eks1-ClusterAutoscalerPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_infra-eks1-cluster-autoscaler-role-031bfc6_infra-eks1-ClusterAutoscalerPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_infra-eks1-cluster-autoscaler-role-031bfc6_infra-eks1-ClusterAutoscalerPolicy" {
	role       = "infra-eks1-cluster-autoscaler-role-031bfc6"
	policy_arn = "arn:aws:iam::186375393473:policy/infra-eks1-ClusterAutoscalerPolicy"
}
