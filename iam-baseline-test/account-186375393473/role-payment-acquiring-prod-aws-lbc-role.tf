# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-aws-lbc-role"
	to = aws_iam_role.role_payment-acquiring-prod-aws-lbc-role
}

resource "aws_iam_role" "role_payment-acquiring-prod-aws-lbc-role" {
	name                 = "payment-acquiring-prod-aws-lbc-role"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRoleWithWebIdentity"
				"Condition" = {
					"StringEquals" = {
						"oidc.eks.ap-southeast-1.amazonaws.com/id/1685E89EDB2F0C313CAE67743DE3D6D7:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
					}
				}
				"Effect" = "Allow"
				"Principal" = {
					"Federated" = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/1685E89EDB2F0C313CAE67743DE3D6D7"
				}
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
}
