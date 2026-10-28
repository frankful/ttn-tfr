# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "Entra-WS-Role"
	to = aws_iam_role.role_Entra-WS-Role
}

resource "aws_iam_role" "role_Entra-WS-Role" {
	name                 = "Entra-WS-Role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"sts:AssumeRoleWithSAML",
					"sts:TagSession"
				]
				"Condition" = {
					"StringEquals" = {
						"SAML:sub_type" = "persistent"
					}
				}
				"Effect" = "Allow"
				"Principal" = {
					"Federated" = "arn:aws:iam::186375393473:saml-provider/Entra-Workspaces"
				}
			}
		]
	})
	path                 = "/"
	description          = "WS-Prod"
	max_session_duration = 3600
}
