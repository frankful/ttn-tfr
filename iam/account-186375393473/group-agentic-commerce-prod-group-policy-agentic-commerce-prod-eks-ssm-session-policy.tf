# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-group:agentic-commerce-prod-eks-ssm-session-policy"
	to = aws_iam_group_policy.group_agentic-commerce-prod-group_uuqni_agentic-commerce-prod-eks-ssm-session-policy
}

resource "aws_iam_group_policy" "group_agentic-commerce-prod-group_uuqni_agentic-commerce-prod-eks-ssm-session-policy" {
	name   = "agentic-commerce-prod-eks-ssm-session-policy"
	group   = "agentic-commerce-prod-group"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"ssm:StartSession",
					"ssm:TerminateSession",
					"ssm:ResumeSession"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:ec2:ap-southeast-1:186375393473:instance/*",
					"arn:aws:ssm:ap-southeast-1:*:document/*"
				]
				"Sid" = "AllowSSMSessionAndForwarding"
			},
			{
				"Action" = [
					"ec2:DescribeInstances",
					"ssm:DescribeSessions",
					"ssm:GetConnectionStatus"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowDescribeForSSM"
			}
		]
	})
}
