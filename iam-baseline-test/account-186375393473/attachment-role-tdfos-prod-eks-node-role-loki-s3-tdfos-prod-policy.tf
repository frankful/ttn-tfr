# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "tdfos-prod-eks-node-role/arn:aws:iam::186375393473:policy/loki-s3-tdfos-prod-policy"
	to = aws_iam_role_policy_attachment.attachment_role_tdfos-prod-eks-node-role_loki-s3-tdfos-prod-policy
}

resource "aws_iam_role_policy_attachment" "attachment_role_tdfos-prod-eks-node-role_loki-s3-tdfos-prod-policy" {
	role       = "tdfos-prod-eks-node-role"
	policy_arn = "arn:aws:iam::186375393473:policy/loki-s3-tdfos-prod-policy"
}
