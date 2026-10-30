# aws_iam_group_membership does not support import; the members below
# are the current inventory snapshot, so the first apply adopts the
# existing membership without removing anyone.
resource "aws_iam_group_membership" "group_AWSSESSendingGroupDoNotRename_membership" {
	name  = "AWSSESSendingGroupDoNotRename-membership"
	group = "AWSSESSendingGroupDoNotRename"
	users = [
		"sre-alert",
	]
}
