# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "sre-alert"
	to = aws_iam_user.user_sre-alert
}

resource "aws_iam_user" "user_sre-alert" {
	name = "sre-alert"
	path = "/"
}
