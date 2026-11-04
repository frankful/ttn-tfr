# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "payment-acquiring:kms-payment-acquiring-policy"
	to = aws_iam_group_policy.group_payment-acquiring_tsnnn_kms-payment-acquiring-policy
}

resource "aws_iam_group_policy" "group_payment-acquiring_tsnnn_kms-payment-acquiring-policy" {
	name   = "kms-payment-acquiring-policy"
	group   = "payment-acquiring"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"kms:ListKeys",
					"kms:ListAliases",
					"kms:DescribeKey"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "KMSServiceBasicList"
			},
			{
				"Action" = [
					"kms:Encrypt",
					"kms:Decrypt",
					"kms:ReEncrypt*",
					"kms:GenerateDataKey*",
					"kms:GetPublicKey"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "KMSDataCryptoOperations"
			}
		]
	})
}
