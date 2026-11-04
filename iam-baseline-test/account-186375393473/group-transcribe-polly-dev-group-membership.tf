# aws_iam_group_membership does not support import; the members below
# are the current inventory snapshot, so the first apply adopts the
# existing membership without removing anyone.
resource "aws_iam_group_membership" "group_Transcribe-Polly-dev-group_membership" {
	name  = "Transcribe-Polly-dev-group-membership"
	group = "Transcribe-Polly-dev-group"
	users = [
		"xielianghai",
	]
}
