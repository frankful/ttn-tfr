# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "liyao"
	to = aws_iam_user.user_liyao
}

resource "aws_iam_user" "user_liyao" {
	name = "liyao"
	path = "/"
	tags = {
		"AKIASWZGW2DAWP67MJI2" = "s3"
	}
}
