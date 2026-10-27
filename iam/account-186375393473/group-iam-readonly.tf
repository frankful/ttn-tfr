resource "aws_iam_group" "group_iam-readonly" {
	name = "iam-readonly"
	path = "/"
}

resource "aws_iam_group_membership" "group_iam-readonly_membership" {
	name  = "iam-readonly-membership"
	group = "iam-readonly"
	users = [
		"iam-readonly",
	]
}

resource "aws_iam_group_policy_attachment" "attachment_group_iam-readonly_eks-readonly" {
	group      = "iam-readonly"
	policy_arn = "arn:aws:iam::186375393473:policy/eks-readonly"
}

resource "aws_iam_group_policy_attachment" "attachment_group_iam-readonly_IAMReadOnlyAccess" {
	group      = "iam-readonly"
	policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}
