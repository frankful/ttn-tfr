# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "zhenya.li"
	to = aws_iam_user.user_zhenya_li
}

resource "aws_iam_user" "user_zhenya_li" {
	name = "zhenya.li"
	path = "/"
}
