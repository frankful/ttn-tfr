# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "cloudwatch-readonly"
	to = aws_iam_group.group_cloudwatch-readonly
}

resource "aws_iam_group" "group_cloudwatch-readonly" {
	name = "cloudwatch-readonly"
	path = "/"
}
