# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "chaichen"
	to = aws_iam_user.user_chaichen
}

resource "aws_iam_user" "user_chaichen" {
	name = "chaichen"
	path = "/"
}
