# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "MyTestEKSNodeRole"
	to = aws_iam_role.role_MyTestEKSNodeRole
}

resource "aws_iam_role" "role_MyTestEKSNodeRole" {
	name                 = "MyTestEKSNodeRole"
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
	description          = "Allows EC2 instances to call AWS services on your behalf."
	max_session_duration = 3600
}
