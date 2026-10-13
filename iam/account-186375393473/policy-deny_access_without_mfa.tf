resource "aws_iam_policy" "managed_policy" {
	name   = "Deny_Access_Without_MFA"
	policy = "{\"Version\": \"2012-10-17\", \"Statement\": [{\"Sid\": \"AllowUserToManageOwnMFA\", \"Action\": [\"iam:CreateVirtualMFADevice\", \"iam:EnableMFADevice\", \"iam:ResyncMFADevice\", \"iam:ListMFADevices\"], \"Effect\": \"Allow\", \"Resource\": \"arn:aws:iam::*:user/$${aws:username}\"}, {\"Sid\": \"DenyAllWithoutMFA\", \"Effect\": \"Deny\", \"Resource\": \"*\", \"Condition\": {\"BoolIfExists\": {\"aws:MultiFactorAuthPresent\": \"false\"}}, \"NotAction\": [\"iam:CreateVirtualMFADevice\", \"iam:EnableMFADevice\", \"iam:ResyncMFADevice\", \"iam:ListMFADevices\", \"iam:ChangePassword\"]}]}"
}
