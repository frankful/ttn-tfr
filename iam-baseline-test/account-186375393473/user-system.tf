resource "aws_iam_user" "user_system" {
	name = "system"
	path = "/"
}

# Group membership is owned by each group's own file
# (group-<group>-membership.tf); this ticket adds this user to: outreadonly
