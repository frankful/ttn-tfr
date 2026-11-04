# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "shawn.dang"
	to = aws_iam_user.user_shawn_dang
}

resource "aws_iam_user" "user_shawn_dang" {
	name = "shawn.dang"
	path = "/"
}
