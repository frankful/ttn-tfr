# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "infra-eks1-efs-csi-driver-role-c59cd78"
	to = aws_iam_role.role_infra-eks1-efs-csi-driver-role-c59cd78
}

resource "aws_iam_role" "role_infra-eks1-efs-csi-driver-role-c59cd78" {
	name                 = "infra-eks1-efs-csi-driver-role-c59cd78"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRoleWithWebIdentity"
				"Condition" = {
					"StringEquals" = {
						"oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021:sub" = "system:serviceaccount:kube-system:efs-csi-controller-sa"
					}
				}
				"Effect" = "Allow"
				"Principal" = {
					"Federated" = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021"
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
