# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "eks-upgrade-backup-role"
	to = aws_iam_role.role_eks-upgrade-backup-role
}

resource "aws_iam_role" "role_eks-upgrade-backup-role" {
	name                 = "eks-upgrade-backup-role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Principal" = {
					"Service" = "backup.amazonaws.com"
				}
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
}
