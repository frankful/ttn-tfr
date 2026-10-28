# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-group"
	to = aws_iam_group.group_agentic-commerce-prod-group
}

resource "aws_iam_group" "group_agentic-commerce-prod-group" {
	name = "agentic-commerce-prod-group"
	path = "/users/"
}
