# aws_iam_group_membership does not support import; the members below
# are the current inventory snapshot, so the first apply adopts the
# existing membership without removing anyone.
resource "aws_iam_group_membership" "group_s3-dcits-software_membership" {
	name  = "s3-dcits-software-membership"
	group = "s3-dcits-software"
	users = [
		"zhaorong",
	]
}
