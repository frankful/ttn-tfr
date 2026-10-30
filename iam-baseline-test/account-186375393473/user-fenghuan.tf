# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "fenghuan"
	to = aws_iam_user.user_fenghuan
}

resource "aws_iam_user" "user_fenghuan" {
	name = "fenghuan"
	path = "/"
}
