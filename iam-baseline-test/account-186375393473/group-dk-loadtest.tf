# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "dk-loadtest"
	to = aws_iam_group.group_dk-loadtest
}

resource "aws_iam_group" "group_dk-loadtest" {
	name = "dk-loadtest"
	path = "/"
}
