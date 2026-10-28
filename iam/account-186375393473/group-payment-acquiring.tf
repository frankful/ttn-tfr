# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "payment-acquiring"
	to = aws_iam_group.group_payment-acquiring
}

resource "aws_iam_group" "group_payment-acquiring" {
	name = "payment-acquiring"
	path = "/"
}
