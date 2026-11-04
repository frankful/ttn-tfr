# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "qianqian.chen"
	to = aws_iam_user.user_qianqian_chen
}

resource "aws_iam_user" "user_qianqian_chen" {
	name = "qianqian.chen"
	path = "/"
}
