# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "chenhao"
	to = aws_iam_user.user_chenhao
}

resource "aws_iam_user" "user_chenhao" {
	name = "chenhao"
	path = "/"
}
