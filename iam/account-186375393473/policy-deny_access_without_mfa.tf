# First-time adoption: import the pre-existing policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:policy/Deny_Access_Without_MFA"
	to = aws_iam_policy.managed_policy
}

resource "aws_iam_policy" "managed_policy" {
	name   = "Deny_Access_Without_MFA"
	policy = "{\"Version\": \"2012-10-17\", \"Statement\": [{\"Action\": \"*\", \"Effect\": \"Deny\", \"Resource\": \"*\", \"Condition\": {\"Bool\": {\"aws:MultiFactorAuthPresent\": \"false\"}}}]}"
}
