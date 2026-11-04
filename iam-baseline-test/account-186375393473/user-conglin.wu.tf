# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "conglin.wu"
	to = aws_iam_user.user_conglin_wu
}

resource "aws_iam_user" "user_conglin_wu" {
	name = "conglin.wu"
	path = "/"
}
