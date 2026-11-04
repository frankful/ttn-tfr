# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "test01"
	to = aws_iam_user.user_test01
}

resource "aws_iam_user" "user_test01" {
	name = "test01"
	path = "/"
	tags = {
		"AKIASWZGW2DA4WRR33RP" = "test01"
	}
}
