# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "supergateway"
	to = aws_iam_group.group_supergateway
}

resource "aws_iam_group" "group_supergateway" {
	name = "supergateway"
	path = "/"
}
