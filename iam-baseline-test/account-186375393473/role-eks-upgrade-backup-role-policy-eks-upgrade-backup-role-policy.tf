# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "eks-upgrade-backup-role:eks-upgrade-backup-role-policy"
	to = aws_iam_role_policy.role_eks-upgrade-backup-role_avvso_policy
}

resource "aws_iam_role_policy" "role_eks-upgrade-backup-role_avvso_policy" {
	name   = "eks-upgrade-backup-role-policy"
	role   = "eks-upgrade-backup-role"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"eks:DescribeCluster",
					"eks:ListAccessEntries",
					"eks:CreateAccessEntry"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:eks:ap-southeast-1:186375393473:cluster/agentic-commerce-prod-cluster"
				]
			},
			{
				"Action" = [
					"eks:DescribeAccessEntry",
					"eks:AssociateAccessPolicy",
					"eks:ListAssociatedAccessPolicies",
					"eks:DisassociateAccessPolicy",
					"eks:DeleteAccessEntry"
				]
				"Effect" = "Allow"
				"Resource" = [
					"*"
				]
			},
			{
				"Action" = "iam:PassRole"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::186375393473:role/eks-upgrade-backup-role"
			},
			{
				"Action" = [
					"backup:DescribeBackupVaults",
					"backup:CreateRecoveryPoint",
					"ec2:DescribeVolumes",
					"ec2:DescribeTags",
					"ec2:CreateSnapshot",
					"ec2:DeleteSnapshot",
					"ec2:DescribeSnapshots",
					"ec2:CreateTags"
				]
				"Effect" = "Allow"
				"Resource" = [
					"*"
				]
			}
		]
	})
}
