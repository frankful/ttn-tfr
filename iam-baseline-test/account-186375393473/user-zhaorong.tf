# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "zhaorong"
	to = aws_iam_user.user_zhaorong
}

resource "aws_iam_user" "user_zhaorong" {
	name = "zhaorong"
	path = "/"
}
