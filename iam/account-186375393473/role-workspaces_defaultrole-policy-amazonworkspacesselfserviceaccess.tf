# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "workspaces_DefaultRole:AmazonWorkSpacesSelfServiceAccess"
	to = aws_iam_role_policy.role_workspaces_DefaultRole_exbzc_policy
}

resource "aws_iam_role_policy" "role_workspaces_DefaultRole_exbzc_policy" {
	name   = "AmazonWorkSpacesSelfServiceAccess"
	role   = "workspaces_DefaultRole"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"workspaces:RebootWorkspaces",
					"workspaces:RebuildWorkspaces",
					"workspaces:ModifyWorkspaceProperties"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			}
		]
	})
}
