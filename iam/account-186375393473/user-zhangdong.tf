# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "zhangdong"
	to = aws_iam_user.user_zhangdong
}

resource "aws_iam_user" "user_zhangdong" {
	name = "zhangdong"
	path = "/"
	tags = {
		"AKIASWZGW2DAVCN7WIEY" = "s3"
	}
}
