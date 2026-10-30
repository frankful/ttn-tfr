# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "guoqing"
	to = aws_iam_user.user_guoqing
}

resource "aws_iam_user" "user_guoqing" {
	name = "guoqing"
	path = "/"
}
