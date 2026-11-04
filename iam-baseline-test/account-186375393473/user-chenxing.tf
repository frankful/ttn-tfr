# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "chenxing"
	to = aws_iam_user.user_chenxing
}

resource "aws_iam_user" "user_chenxing" {
	name = "chenxing"
	path = "/"
}
