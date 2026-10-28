# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "rds-monitoring-role"
	to = aws_iam_role.role_rds-monitoring-role
}

resource "aws_iam_role" "role_rds-monitoring-role" {
	name                 = "rds-monitoring-role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Principal" = {
					"Service" = "monitoring.rds.amazonaws.com"
				}
				"Sid" = ""
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
}
