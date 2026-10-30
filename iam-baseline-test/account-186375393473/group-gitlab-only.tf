# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "gitlab-only"
	to = aws_iam_group.group_gitlab-only
}

resource "aws_iam_group" "group_gitlab-only" {
	name = "gitlab-only"
	path = "/"
}
