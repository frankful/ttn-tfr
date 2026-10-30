# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "Entra-WS-Role:EntraPoolsAccess"
	to = aws_iam_role_policy.role_Entra-WS-Role_hhkhf_policy
}

resource "aws_iam_role_policy" "role_Entra-WS-Role_hhkhf_policy" {
	name   = "EntraPoolsAccess"
	role   = "Entra-WS-Role"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "workspaces:Stream"
				"Condition" = {
					"StringEquals" = {
						"workspaces:userId" = "$${saml:sub}"
					}
				}
				"Effect" = "Allow"
				"Resource" = "arn:aws:workspaces:ap-southeast-1:186375393473:directory/d-9667a17841"
			}
		]
	})
}
