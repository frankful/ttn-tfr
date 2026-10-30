# aws_iam_group_membership does not support import; the members below
# are the current inventory snapshot, so the first apply adopts the
# existing membership without removing anyone.
resource "aws_iam_group_membership" "group_cibs-dev-s3_membership" {
	name  = "cibs-dev-s3-membership"
	group = "cibs-dev-s3"
	users = [
		"cibs-develop-s3",
	]
}
