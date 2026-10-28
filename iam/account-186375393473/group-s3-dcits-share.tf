# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "s3-dcits-share"
	to = aws_iam_group.group_s3-dcits-share
}

resource "aws_iam_group" "group_s3-dcits-share" {
	name = "s3-dcits-share"
	path = "/"
}
