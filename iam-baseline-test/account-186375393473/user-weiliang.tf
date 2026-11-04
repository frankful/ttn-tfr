# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "weiliang"
	to = aws_iam_user.user_weiliang
}

resource "aws_iam_user" "user_weiliang" {
	name = "weiliang"
	path = "/"
}
