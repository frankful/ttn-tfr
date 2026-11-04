# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "tdfos-prod-cluster-ebs-csi-driver-irsa"
	to = aws_iam_role.role_tdfos-prod-cluster-ebs-csi-driver-irsa
}

resource "aws_iam_role" "role_tdfos-prod-cluster-ebs-csi-driver-irsa" {
	name                 = "tdfos-prod-cluster-ebs-csi-driver-irsa"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRoleWithWebIdentity"
				"Condition" = {
					"StringEquals" = {
						"oidc.eks.ap-southeast-1.amazonaws.com/id/27E3033278EB36471871D323CC68E91E:sub" = "system:serviceaccount:kube-system:ebs-csi-controller-sa"
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
