# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "franksun"
	to = aws_iam_user.user_franksun
}

resource "aws_iam_user" "user_franksun" {
	name = "franksun"
	path = "/"
	tags = {
		"AKIASWZGW2DATHMJO7VO" = "frank"
	}
}
