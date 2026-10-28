# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "chenshang"
	to = aws_iam_user.user_chenshang
}

resource "aws_iam_user" "user_chenshang" {
	name = "chenshang"
	path = "/"
}
