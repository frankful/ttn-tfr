# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "bingjie.chen"
	to = aws_iam_user.user_bingjie_chen
}

resource "aws_iam_user" "user_bingjie_chen" {
	name = "bingjie.chen"
	path = "/"
}
