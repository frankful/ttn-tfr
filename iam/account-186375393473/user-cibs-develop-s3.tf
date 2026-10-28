# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "cibs-develop-s3"
	to = aws_iam_user.user_cibs-develop-s3
}

resource "aws_iam_user" "user_cibs-develop-s3" {
	name = "cibs-develop-s3"
	path = "/"
}
