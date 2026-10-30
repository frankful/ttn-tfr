# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "wangjie"
	to = aws_iam_user.user_wangjie
}

resource "aws_iam_user" "user_wangjie" {
	name = "wangjie"
	path = "/"
}
