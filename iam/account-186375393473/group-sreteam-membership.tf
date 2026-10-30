# Declared here, not in group-sreteam.tf: one Terraform owner per (user, group)
# edge, so a membership change and the group itself never fight.
# The resource address is unchanged, so moving it produces an empty plan.
resource "aws_iam_group_membership" "group_SRETeam_membership" {
	name  = "SRETeam-membership"
	group = "SRETeam"
	users = [
		"allen.guan",
		"franksun",
		"wellcai",
	]
}
