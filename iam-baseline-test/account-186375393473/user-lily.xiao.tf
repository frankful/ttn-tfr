# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "lily.xiao"
	to = aws_iam_user.user_lily_xiao
}

resource "aws_iam_user" "user_lily_xiao" {
	name = "lily.xiao"
	path = "/"
}
