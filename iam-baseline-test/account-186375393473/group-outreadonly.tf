# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "outreadonly"
	to = aws_iam_group.group_outreadonly
}

resource "aws_iam_group" "group_outreadonly" {
	name = "outreadonly"
	path = "/"
}
