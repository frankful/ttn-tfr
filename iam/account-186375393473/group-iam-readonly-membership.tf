# Declared here, not in group-iam-readonly.tf: one Terraform owner per
# (user, group) edge, so a membership change and the group itself never fight.
# The resource address is unchanged, so moving it produces an empty plan.
resource "aws_iam_group_membership" "group_iam-readonly_membership" {
	name  = "iam-readonly-membership"
	group = "iam-readonly"
	users = [
		"iam-readonly",
	]
}
