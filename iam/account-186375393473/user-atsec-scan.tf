# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "atsec-scan"
	to = aws_iam_user.user_atsec-scan
}

resource "aws_iam_user" "user_atsec-scan" {
	name = "atsec-scan"
	path = "/"
}
