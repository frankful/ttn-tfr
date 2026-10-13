resource "aws_iam_group_policy_attachment" "managed_attachment" {
	group      = "tdfos-prod-group"
	policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}
