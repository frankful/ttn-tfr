# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "happy"
	to = aws_iam_user.user_happy
}

resource "aws_iam_user" "user_happy" {
	name = "happy"
	path = "/"
	tags = {
		"AKIASWZGW2DAYJUQVSQK" = "happy-aksk"
	}
}
