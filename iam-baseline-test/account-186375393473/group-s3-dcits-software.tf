# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "s3-dcits-software"
	to = aws_iam_group.group_s3-dcits-software
}

resource "aws_iam_group" "group_s3-dcits-software" {
	name = "s3-dcits-software"
	path = "/"
}
