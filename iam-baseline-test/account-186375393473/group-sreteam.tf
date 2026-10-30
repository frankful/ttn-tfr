# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "SRETeam"
	to = aws_iam_group.group_SRETeam
}

resource "aws_iam_group" "group_SRETeam" {
	name = "SRETeam"
	path = "/"
}
