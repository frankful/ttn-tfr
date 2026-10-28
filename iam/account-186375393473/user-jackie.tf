# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "jackie"
	to = aws_iam_user.user_jackie
}

resource "aws_iam_user" "user_jackie" {
	name = "jackie"
	path = "/"
}
