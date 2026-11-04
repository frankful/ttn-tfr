# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "dev-galaxy-sns-alert"
	to = aws_iam_role.role_dev-galaxy-sns-alert
}

resource "aws_iam_role" "role_dev-galaxy-sns-alert" {
	name                 = "dev-galaxy-sns-alert"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRoleWithWebIdentity"
				"Condition" = {
					"StringEquals" = {
						"oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021:aud" = "sts.amazonaws.com"
						"oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021:sub" = "system:serviceaccount:galaxy:alarm-receiver-service"
					}
				}
				"Effect" = "Allow"
				"Principal" = {
					"Federated" = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021"
				}
				"Sid" = "AllowEksSaAssumeWebIdentity"
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
}
