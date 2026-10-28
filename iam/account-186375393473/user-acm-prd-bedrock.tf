# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "acm-prd-bedrock"
	to = aws_iam_user.user_acm-prd-bedrock
}

resource "aws_iam_user" "user_acm-prd-bedrock" {
	name = "acm-prd-bedrock"
	path = "/"
}
