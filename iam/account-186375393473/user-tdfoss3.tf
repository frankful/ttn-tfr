# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "tdfoss3"
	to = aws_iam_user.user_tdfoss3
}

resource "aws_iam_user" "user_tdfoss3" {
	name = "tdfoss3"
	path = "/"
}
