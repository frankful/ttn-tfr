# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "guomiao"
	to = aws_iam_user.user_guomiao
}

resource "aws_iam_user" "user_guomiao" {
	name = "guomiao"
	path = "/"
}
