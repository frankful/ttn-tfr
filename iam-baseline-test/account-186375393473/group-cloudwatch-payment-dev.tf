# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "cloudwatch-payment-dev"
	to = aws_iam_group.group_cloudwatch-payment-dev
}

resource "aws_iam_group" "group_cloudwatch-payment-dev" {
	name = "cloudwatch-payment-dev"
	path = "/"
}
