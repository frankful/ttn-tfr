# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "Liquidity_Automation_Role:Liquidity_Automation_RolePolicy"
	to = aws_iam_role_policy.role_Liquidity_Automation_Role_vbihi_policy
}

resource "aws_iam_role_policy" "role_Liquidity_Automation_Role_vbihi_policy" {
	name   = "Liquidity_Automation_RolePolicy"
	role   = "Liquidity_Automation_Role"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"ec2:StartInstances",
					"ec2:StopInstances"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:ec2:*:*:instance/i-006958f28fe49b339",
					"arn:aws:ec2:*:*:instance/i-0cfd62641e97525ae"
				]
			}
		]
	})
}
