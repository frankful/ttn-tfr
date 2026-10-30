# aws_iam_group_membership does not support import; the members below
# are the current inventory snapshot, so the first apply adopts the
# existing membership without removing anyone.
resource "aws_iam_group_membership" "group_agentic-commerce-prod-group_membership" {
	name  = "agentic-commerce-prod-group-membership"
	group = "agentic-commerce-prod-group"
	users = [
		"peicai",
		"xielianghai",
	]
}
