# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "tdfos-prod-aws-lbc-role"
	to = aws_iam_role.role_tdfos-prod-aws-lbc-role
}

resource "aws_iam_role" "role_tdfos-prod-aws-lbc-role" {
	name                 = "tdfos-prod-aws-lbc-role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRoleWithWebIdentity"
				"Condition" = {
					"StringEquals" = {
						"oidc.eks.ap-southeast-1.amazonaws.com/id/27E3033278EB36471871D323CC68E91E:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
					}
				}
				"Effect" = "Allow"
				"Principal" = {
					"Federated" = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/27E3033278EB36471871D323CC68E91E"
				}
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
}
