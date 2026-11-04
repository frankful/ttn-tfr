# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "tdfos-prod-group"
	to = aws_iam_group.group_tdfos-prod-group
}

resource "aws_iam_group" "group_tdfos-prod-group" {
	name = "tdfos-prod-group"
	path = "/users/"
}
