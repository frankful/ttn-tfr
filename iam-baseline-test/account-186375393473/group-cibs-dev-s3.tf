# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "cibs-dev-s3"
	to = aws_iam_group.group_cibs-dev-s3
}

resource "aws_iam_group" "group_cibs-dev-s3" {
	name = "cibs-dev-s3"
	path = "/"
}
