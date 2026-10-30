# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-kms-irsa-role:agentic-commerce-prod-kms-policy"
	to = aws_iam_role_policy.role_agentic-commerce-prod-kms-irsa-role_cnlmw_policy
}

resource "aws_iam_role_policy" "role_agentic-commerce-prod-kms-irsa-role_cnlmw_policy" {
	name   = "agentic-commerce-prod-kms-policy"
	role   = "agentic-commerce-prod-kms-irsa-role"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"kms:GenerateDataKey",
					"kms:Decrypt"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:kms:ap-southeast-1:186375393473:key/fd7834ed-17ca-4b3e-b6d1-2afd54d28b0a"
			}
		]
	})
}
