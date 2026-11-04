# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "infra-eks1-nodegroup-role-6e24d61:dev-kms-access"
	to = aws_iam_role_policy.role_infra-eks1-nodegroup-role-6e24d61_jwgqy_policy
}

resource "aws_iam_role_policy" "role_infra-eks1-nodegroup-role-6e24d61_jwgqy_policy" {
	name   = "dev-kms-access"
	role   = "infra-eks1-nodegroup-role-6e24d61"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"kms:GetParametersForImport",
					"kms:GetPublicKey",
					"kms:Decrypt",
					"kms:GetKeyLastUsage",
					"kms:ListKeyPolicies",
					"kms:ListKeyRotations",
					"kms:GetKeyRotationStatus",
					"kms:GetKeyPolicy",
					"kms:DescribeKey",
					"kms:ListResourceTags",
					"kms:ListGrants"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:kms:ap-southeast-1:186375393473:key/5e476400-f1df-428f-880a-05ca712b80bb",
					"arn:aws:kms:ap-southeast-1:186375393473:key/07f2a94d-7b5f-4ae6-b94f-bcd63480d9c4"
				]
				"Sid" = "VisualEditor0"
			},
			{
				"Action" = [
					"kms:DescribeCustomKeyStores",
					"kms:ListKeys",
					"kms:ListRetirableGrants",
					"kms:ListAliases"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "VisualEditor1"
			}
		]
	})
}
