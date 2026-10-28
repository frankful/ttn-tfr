# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "peicai"
	to = aws_iam_user.user_peicai
}

resource "aws_iam_user" "user_peicai" {
	name = "peicai"
	path = "/"
	tags = {
		"AKIASWZGW2DAUOV2PZVN" = "peicai"
	}
}
