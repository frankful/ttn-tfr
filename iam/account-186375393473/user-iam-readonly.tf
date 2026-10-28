# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "iam-readonly"
	to = aws_iam_user.user_iam-readonly
}

resource "aws_iam_user" "user_iam-readonly" {
	name = "iam-readonly"
	path = "/"
}
