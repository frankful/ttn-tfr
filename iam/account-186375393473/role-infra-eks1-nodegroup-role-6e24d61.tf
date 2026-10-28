# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "infra-eks1-nodegroup-role-6e24d61"
	to = aws_iam_role.role_infra-eks1-nodegroup-role-6e24d61
}

resource "aws_iam_role" "role_infra-eks1-nodegroup-role-6e24d61" {
	name                 = "infra-eks1-nodegroup-role-6e24d61"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Principal" = {
					"Service" = "ec2.amazonaws.com"
				}
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
	tags                 = {
		"Owner" = "platform-team"
	}
}
