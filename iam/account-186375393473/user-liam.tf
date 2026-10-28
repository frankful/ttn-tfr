# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "liam"
	to = aws_iam_user.user_liam
}

resource "aws_iam_user" "user_liam" {
	name = "liam"
	path = "/"
}
