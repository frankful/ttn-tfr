# First-time adoption: import the pre-existing policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:policy/gitlab-snapshot-manager"
	to = aws_iam_policy.managed_policy_gitlab-snapshot-manager
}

resource "aws_iam_policy" "managed_policy_gitlab-snapshot-manager" {
	name   = "gitlab-snapshot-manager"
	path   = "/"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"ec2:DescribeInstances",
					"ec2:DescribeVolumes",
					"ec2:DescribeSnapshots"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			},
			{
				"Action" = [
					"ec2:StopInstances",
					"ec2:StartInstances"
				]
				"Condition" = {
					"StringEquals" = {
						"ec2:ResourceTag/Name" = "infra-devops-gitlab-0"
					}
				}
				"Effect" = "Allow"
				"Resource" = "arn:aws:ec2:*:*:instance/*"
			},
			{
				"Action" = [
					"ec2:CreateSnapshot",
					"ec2:DeleteSnapshot",
					"ec2:CreateTags"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:ec2:*:*:volume/*",
					"arn:aws:ec2:ap-southeast-1::snapshot/*"
				]
			}
		]
	})
}
