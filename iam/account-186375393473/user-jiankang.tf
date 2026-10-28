# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "jiankang"
	to = aws_iam_user.user_jiankang
}

resource "aws_iam_user" "user_jiankang" {
	name = "jiankang"
	path = "/"
}
