# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "tudi.liang"
	to = aws_iam_user.user_tudi_liang
}

resource "aws_iam_user" "user_tudi_liang" {
	name = "tudi.liang"
	path = "/"
}
