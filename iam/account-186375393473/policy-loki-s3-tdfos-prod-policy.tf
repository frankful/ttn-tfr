# First-time adoption: import the pre-existing policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:policy/loki-s3-tdfos-prod-policy"
	to = aws_iam_policy.managed_policy_loki-s3-tdfos-prod-policy
}

resource "aws_iam_policy" "managed_policy_loki-s3-tdfos-prod-policy" {
	name   = "loki-s3-tdfos-prod-policy"
	path   = "/"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"s3:ListBucket"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:s3:::tdfos-prod"
				"Sid" = "LokiS3ListBucket"
			},
			{
				"Action" = [
					"s3:GetObject",
					"s3:PutObject",
					"s3:DeleteObject",
					"s3:AbortMultipartUpload",
					"s3:ListMultipartUploadParts"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:s3:::tdfos-prod/*"
				"Sid" = "LokiS3ObjectRWDel"
			}
		]
	})
}
