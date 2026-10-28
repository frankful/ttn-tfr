# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "AmazonEKSPodIdentityAmazonEFSCSIRole"
	to = aws_iam_role.role_AmazonEKSPodIdentityAmazonEFSCSIRole
}

resource "aws_iam_role" "role_AmazonEKSPodIdentityAmazonEFSCSIRole" {
	name                 = "AmazonEKSPodIdentityAmazonEFSCSIRole"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"sts:AssumeRole",
					"sts:TagSession"
				]
				"Effect" = "Allow"
				"Principal" = {
					"Service" = "pods.eks.amazonaws.com"
				}
			}
		]
	})
	path                 = "/"
	description          = "Allows pods running in Amazon EKS cluster to access AWS resources."
	max_session_duration = 3600
}
