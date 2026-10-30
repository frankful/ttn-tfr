# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "Liquidity_Automation_Role"
	to = aws_iam_role.role_Liquidity_Automation_Role
}

resource "aws_iam_role" "role_Liquidity_Automation_Role" {
	name                 = "Liquidity_Automation_Role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Principal" = {
					"Service" = "ssm.amazonaws.com"
				}
				"Sid" = ""
			}
		]
	})
	path                 = "/"
	description          = "Allows SSM to call AWS services on your behalf"
	max_session_duration = 3600
}
