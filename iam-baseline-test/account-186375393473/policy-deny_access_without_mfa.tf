# First-time adoption: import the pre-existing policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:policy/Deny_Access_Without_MFA"
	to = aws_iam_policy.managed_policy_Deny_Access_Without_MFA
}

resource "aws_iam_policy" "managed_policy_Deny_Access_Without_MFA" {
	name   = "Deny_Access_Without_MFA"
	path   = "/"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"iam:CreateVirtualMFADevice",
					"iam:EnableMFADevice",
					"iam:ResyncMFADevice",
					"iam:ListMFADevices"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::*:user/$${aws:username}"
				"Sid" = "AllowUserToManageOwnMFA"
			},
			{
				"Condition" = {
					"BoolIfExists" = {
						"aws:MultiFactorAuthPresent" = "false"
					}
				}
				"Effect" = "Deny"
				"NotAction" = [
					"iam:CreateVirtualMFADevice",
					"iam:EnableMFADevice",
					"iam:ResyncMFADevice",
					"iam:ListMFADevices",
					"iam:ChangePassword"
				]
				"Resource" = "*"
				"Sid" = "DenyAllWithoutMFA"
			}
		]
	})
	description = "Deny_Access_Without_MFA"
}
