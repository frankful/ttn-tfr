# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "yawei.liu"
	to = aws_iam_user.user_yawei_liu
}

resource "aws_iam_user" "user_yawei_liu" {
	name = "yawei.liu"
	path = "/"
}
