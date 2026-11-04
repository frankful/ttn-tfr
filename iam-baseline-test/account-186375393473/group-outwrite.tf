# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "outwrite"
	to = aws_iam_group.group_outwrite
}

resource "aws_iam_group" "group_outwrite" {
	name = "outwrite"
	path = "/"
}
