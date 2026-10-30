# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "iam-readonly/arn:aws:iam::186375393473:policy/eks-readonly"
	to = aws_iam_group_policy_attachment.attachment_group_iam-readonly_eks-readonly
}

resource "aws_iam_group_policy_attachment" "attachment_group_iam-readonly_eks-readonly" {
	group      = "iam-readonly"
	policy_arn = "arn:aws:iam::186375393473:policy/eks-readonly"
}
