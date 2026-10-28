# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "outbound-apikey"
	to = aws_iam_user.user_outbound-apikey
}

resource "aws_iam_user" "user_outbound-apikey" {
	name = "outbound-apikey"
	path = "/"
}
