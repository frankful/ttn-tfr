# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "ecr-access-group"
	to = aws_iam_group.group_ecr-access-group
}

resource "aws_iam_group" "group_ecr-access-group" {
	name = "ecr-access-group"
	path = "/"
}
