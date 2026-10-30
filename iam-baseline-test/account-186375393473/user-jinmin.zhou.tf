# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "jinmin.zhou"
	to = aws_iam_user.user_jinmin_zhou
}

resource "aws_iam_user" "user_jinmin_zhou" {
	name = "jinmin.zhou"
	path = "/"
}
