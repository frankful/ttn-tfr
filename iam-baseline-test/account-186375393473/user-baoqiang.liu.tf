# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "baoqiang.liu"
	to = aws_iam_user.user_baoqiang_liu
}

resource "aws_iam_user" "user_baoqiang_liu" {
	name = "baoqiang.liu"
	path = "/"
}
