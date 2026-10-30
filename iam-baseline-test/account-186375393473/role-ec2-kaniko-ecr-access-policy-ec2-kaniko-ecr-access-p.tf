# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "ec2-kaniko-ecr-access:ec2-kaniko-ecr-access-p"
	to = aws_iam_role_policy.role_ec2-kaniko-ecr-access_gqtna_policy
}

resource "aws_iam_role_policy" "role_ec2-kaniko-ecr-access_gqtna_policy" {
	name   = "ec2-kaniko-ecr-access-p"
	role   = "ec2-kaniko-ecr-access"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"ecr:GetAuthorizationToken",
					"ecr:BatchCheckLayerAvailability",
					"ecr:GetDownloadUrlForLayer",
					"ecr:GetRepositoryPolicy",
					"ecr:DescribeRepositories",
					"ecr:ListImages",
					"ecr:DescribeImages",
					"ecr:BatchGetImage",
					"ecr:PutImage",
					"ecr:InitiateLayerUpload",
					"ecr:UploadLayerPart",
					"ecr:CompleteLayerUpload",
					"ecr:SetRepositoryPolicy",
					"ecr:DeleteRepositoryPolicy",
					"ecr:CreateRepository",
					"ecr:DeleteRepository"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			}
		]
	})
}
