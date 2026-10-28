# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "ecr-access-group:ecr-private-access"
	to = aws_iam_group_policy.group_ecr-access-group_ugyhg_ecr-private-access
}

resource "aws_iam_group_policy" "group_ecr-access-group_ugyhg_ecr-private-access" {
	name   = "ecr-private-access"
	group   = "ecr-access-group"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "ecr:GetAuthorizationToken"
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "ECRGetLoginToken"
			},
			{
				"Action" = [
					"ecr:BatchCheckLayerAvailability",
					"ecr:GetDownloadUrlForLayer",
					"ecr:BatchGetImage",
					"ecr:InitiateLayerUpload",
					"ecr:UploadLayerPart",
					"ecr:CompleteLayerUpload",
					"ecr:PutImage",
					"ecr:DescribeRepositories",
					"ecr:DescribeImages"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:ecr:ap-southeast-1:186375393473:repository/*"
				"Sid" = "ECRPushPull"
			}
		]
	})
}
