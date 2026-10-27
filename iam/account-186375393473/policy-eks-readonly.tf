resource "aws_iam_policy" "managed_policy_eks-readonly" {
	name   = "eks-readonly"
	path   = "/"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"eks:ListClusters",
					"eks:DescribeCluster",
					"eks:ListNodegroups",
					"eks:DescribeNodegroup",
					"eks:ListAddons",
					"eks:DescribeAddon",
					"eks:ListFargateProfiles",
					"eks:DescribeFargateProfile"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "EksReadOnlyListAndDescribe"
			},
			{
				"Action" = [
					"ec2:DescribeLaunchTemplateVersions",
					"ec2:DescribeLaunchTemplates"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "Ec2ReadOnlyLT"
			}
		]
	})
}
