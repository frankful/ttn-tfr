resource "aws_iam_policy" "managed_policy" {
	name   = "Deny_Access_Without_MFA"
	policy = "{\"Version\": \"2012-10-17\", \"Statement\": [{\"Action\": \"*\", \"Effect\": \"Deny\", \"Resource\": \"*\", \"Condition\": {\"Bool\": {\"aws:MultiFactorAuthPresent\": \"false\"}}}]}"
}
