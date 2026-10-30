# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-group"
	to = aws_iam_group.group_payment-acquiring-prod-group
}

resource "aws_iam_group" "group_payment-acquiring-prod-group" {
	name = "payment-acquiring-prod-group"
	path = "/users/"
}
