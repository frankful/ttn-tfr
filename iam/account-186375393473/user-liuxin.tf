# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "liuxin"
	to = aws_iam_user.user_liuxin
}

resource "aws_iam_user" "user_liuxin" {
	name = "liuxin"
	path = "/"
}
