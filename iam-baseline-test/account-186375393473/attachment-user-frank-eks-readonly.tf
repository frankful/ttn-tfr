resource "aws_iam_user_policy_attachment" "attachment_user_frank_eks-readonly" {
	user       = "frank"
	policy_arn = "arn:aws:iam::186375393473:policy/eks-readonly"
}
