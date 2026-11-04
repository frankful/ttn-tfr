# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "rds-query-group"
	to = aws_iam_group.group_rds-query-group
}

resource "aws_iam_group" "group_rds-query-group" {
	name = "rds-query-group"
	path = "/"
}
