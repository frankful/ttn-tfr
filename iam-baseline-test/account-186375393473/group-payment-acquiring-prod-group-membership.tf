# aws_iam_group_membership does not support import; the members below
# are the current inventory snapshot, so the first apply adopts the
# existing membership without removing anyone.
resource "aws_iam_group_membership" "group_payment-acquiring-prod-group_membership" {
	name  = "payment-acquiring-prod-group-membership"
	group = "payment-acquiring-prod-group"
	users = [
		"chenhao",
		"chenxing",
		"jackie",
		"maying",
	]
}
