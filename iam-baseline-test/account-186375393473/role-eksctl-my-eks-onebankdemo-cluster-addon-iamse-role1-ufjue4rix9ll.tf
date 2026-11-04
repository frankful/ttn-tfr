# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-ufJUe4RIX9Ll"
	to = aws_iam_role.role_eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-ufJUe4RIX9Ll
}

resource "aws_iam_role" "role_eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-ufJUe4RIX9Ll" {
	name                 = "eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-ufJUe4RIX9Ll"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRoleWithWebIdentity"
				"Condition" = {
					"StringEquals" = {
						"oidc.eks.ap-southeast-1.amazonaws.com/id/C16D848B3D359DC5047B386C3B905A50:aud" = "sts.amazonaws.com"
						"oidc.eks.ap-southeast-1.amazonaws.com/id/C16D848B3D359DC5047B386C3B905A50:sub" = [
							"system:serviceaccount:kube-system:external-dns",
							"system:serviceaccount:cert-manager:cert-manager"
						]
					}
				}
				"Effect" = "Allow"
				"Principal" = {
					"Federated" = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/C16D848B3D359DC5047B386C3B905A50"
				}
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
	tags                 = {
		"alpha.eksctl.io/cluster-name" = "my-eks-onebankdemo-cluster"
		"alpha.eksctl.io/eksctl-version" = "0.221.0"
		"alpha.eksctl.io/iamserviceaccount-name" = "kube-system/external-dns"
		"eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "my-eks-onebankdemo-cluster"
	}
}
