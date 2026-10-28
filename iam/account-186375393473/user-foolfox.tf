# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "foolfox"
	to = aws_iam_user.user_foolfox
}

resource "aws_iam_user" "user_foolfox" {
	name = "foolfox"
	path = "/"
}
