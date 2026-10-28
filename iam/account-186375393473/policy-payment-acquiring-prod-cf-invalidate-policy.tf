# First-time adoption: import the pre-existing policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:policy/payment-acquiring-prod-cf-invalidate-policy"
	to = aws_iam_policy.managed_policy_payment-acquiring-prod-cf-invalidate-policy
}

resource "aws_iam_policy" "managed_policy_payment-acquiring-prod-cf-invalidate-policy" {
	name   = "payment-acquiring-prod-cf-invalidate-policy"
	path   = "/"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"cloudfront:CreateInvalidation"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:cloudfront::186375393473:distribution/E3I9AR66488WEF",
					"arn:aws:cloudfront::186375393473:distribution/E1UU4KGPYPADEF",
					"arn:aws:cloudfront::186375393473:distribution/E1SAHK8N65DM7Z",
					"arn:aws:cloudfront::186375393473:distribution/E24K1A7416UCZN"
				]
			}
		]
	})
	description = "Allow CI/CD to invalidate CloudFront cache for both S3 Web apps"
}
