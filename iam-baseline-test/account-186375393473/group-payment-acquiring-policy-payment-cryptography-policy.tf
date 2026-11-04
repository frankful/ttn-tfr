# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "payment-acquiring:payment-cryptography-policy"
	to = aws_iam_group_policy.group_payment-acquiring_uqosc_payment-cryptography-policy
}

resource "aws_iam_group_policy" "group_payment-acquiring_uqosc_payment-cryptography-policy" {
	name   = "payment-cryptography-policy"
	group   = "payment-acquiring"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"payment-cryptography:ListKeys",
					"payment-cryptography:GetKey",
					"payment-cryptography:GetPublicKeyCertificate",
					"payment-cryptography:EncryptData",
					"payment-cryptography:DecryptData",
					"payment-cryptography:ReEncryptData",
					"payment-cryptography:GeneratePinData",
					"payment-cryptography:VerifyPinData",
					"payment-cryptography:VerifyCardValidationData",
					"payment-cryptography:GenerateCardValidationData"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "PaymentCryptographyReadAndUseKeys"
			}
		]
	})
}
