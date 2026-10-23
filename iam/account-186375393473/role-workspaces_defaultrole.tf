# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "workspaces_DefaultRole"
	to = aws_iam_role.role_workspaces_DefaultRole
}

resource "aws_iam_role" "role_workspaces_DefaultRole" {
	name               = "workspaces_DefaultRole"
	assume_role_policy = jsonencode({
		"Version" = "2008-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Principal" = {
					"Service" = "workspaces.amazonaws.com"
				}
			}
		]
	})
}
