# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "cloudwatch-deveop"
	to = aws_iam_group.group_cloudwatch-deveop
}

resource "aws_iam_group" "group_cloudwatch-deveop" {
	name = "cloudwatch-deveop"
	path = "/"
}
