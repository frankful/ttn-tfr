# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "tianbing"
	to = aws_iam_user.user_tianbing
}

resource "aws_iam_user" "user_tianbing" {
	name = "tianbing"
	path = "/"
	tags = {
		"AKIASWZGW2DASSHL3COP" = "dev-test"
	}
}
