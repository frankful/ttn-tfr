# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "maying"
	to = aws_iam_user.user_maying
}

resource "aws_iam_user" "user_maying" {
	name = "maying"
	path = "/"
}
