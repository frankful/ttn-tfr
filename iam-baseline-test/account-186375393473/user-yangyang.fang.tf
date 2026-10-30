# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "yangyang.fang"
	to = aws_iam_user.user_yangyang_fang
}

resource "aws_iam_user" "user_yangyang_fang" {
	name = "yangyang.fang"
	path = "/"
}
