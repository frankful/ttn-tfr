# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "akin"
	to = aws_iam_user.user_akin
}

resource "aws_iam_user" "user_akin" {
	name = "akin"
	path = "/"
	tags = {
		"AKIASWZGW2DATA7UTKID" = "akin-aksk"
	}
}
