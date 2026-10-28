# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "yadong.liu"
	to = aws_iam_user.user_yadong_liu
}

resource "aws_iam_user" "user_yadong_liu" {
	name = "yadong.liu"
	path = "/"
	tags = {
		"AKIASWZGW2DAUL2SWTKS" = "outbound"
		"AKIASWZGW2DAXETNEBT3" = "uploadtest"
	}
}
