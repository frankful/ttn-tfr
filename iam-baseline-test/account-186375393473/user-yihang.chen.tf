# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "yihang.chen"
	to = aws_iam_user.user_yihang_chen
}

resource "aws_iam_user" "user_yihang_chen" {
	name = "yihang.chen"
	path = "/"
}
