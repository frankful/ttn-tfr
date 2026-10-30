# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "heyang"
	to = aws_iam_user.user_heyang
}

resource "aws_iam_user" "user_heyang" {
	name = "heyang"
	path = "/"
}
