# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "dev"
	to = aws_iam_user.user_dev
}

resource "aws_iam_user" "user_dev" {
	name = "dev"
	path = "/"
}
