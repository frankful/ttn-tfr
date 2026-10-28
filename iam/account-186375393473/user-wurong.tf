# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "wurong"
	to = aws_iam_user.user_wurong
}

resource "aws_iam_user" "user_wurong" {
	name = "wurong"
	path = "/"
	tags = {
		"AKIASWZGW2DAZJQ4ZXQK" = "supergateway"
		"Name" = "wurong"
	}
}
