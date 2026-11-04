# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "welltem"
	to = aws_iam_user.user_welltem
}

resource "aws_iam_user" "user_welltem" {
	name = "welltem"
	path = "/"
	tags = {
		"project" = "acm-prd"
	}
}
