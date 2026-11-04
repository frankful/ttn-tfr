# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "jinchun.ma"
	to = aws_iam_user.user_jinchun_ma
}

resource "aws_iam_user" "user_jinchun_ma" {
	name = "jinchun.ma"
	path = "/"
}
