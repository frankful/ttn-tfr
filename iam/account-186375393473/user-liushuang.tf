# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "liushuang"
	to = aws_iam_user.user_liushuang
}

resource "aws_iam_user" "user_liushuang" {
	name = "liushuang"
	path = "/"
}
