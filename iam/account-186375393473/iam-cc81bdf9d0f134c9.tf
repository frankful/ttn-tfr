resource "aws_iam_user_policy_attachment" "managed_attachment" {
	user       = "iam-readonly"
	policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}
