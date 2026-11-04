# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "wellcai"
	to = aws_iam_user.user_wellcai
}

resource "aws_iam_user" "user_wellcai" {
	name = "wellcai"
	path = "/"
	tags = {
		"AKIASWZGW2DA2T5VXO5F" = "cli"
		"AKIASWZGW2DAYLQ3MG4T" = "s3_upload"
	}
}
