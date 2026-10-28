# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "allen.guan"
	to = aws_iam_user.user_allen_guan
}

resource "aws_iam_user" "user_allen_guan" {
	name = "allen.guan"
	path = "/"
}
