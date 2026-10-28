# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "guance.chen"
	to = aws_iam_user.user_guance_chen
}

resource "aws_iam_user" "user_guance_chen" {
	name = "guance.chen"
	path = "/"
}
