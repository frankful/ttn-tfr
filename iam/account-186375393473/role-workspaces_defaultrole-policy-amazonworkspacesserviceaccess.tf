# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "workspaces_DefaultRole:AmazonWorkSpacesServiceAccess"
	to = aws_iam_role_policy.role_workspaces_DefaultRole_vxzjb_policy
}

resource "aws_iam_role_policy" "role_workspaces_DefaultRole_vxzjb_policy" {
	name   = "AmazonWorkSpacesServiceAccess"
	role   = "workspaces_DefaultRole"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"ec2:CreateNetworkInterface",
					"ec2:DeleteNetworkInterface",
					"ec2:DescribeNetworkInterfaces"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			}
		]
	})
}
