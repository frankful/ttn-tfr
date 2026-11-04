# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "payment-acquiring:s3-payment-acquiring-policy"
	to = aws_iam_group_policy.group_payment-acquiring_dgnws_s3-payment-acquiring-policy
}

resource "aws_iam_group_policy" "group_payment-acquiring_dgnws_s3-payment-acquiring-policy" {
	name   = "s3-payment-acquiring-policy"
	group   = "payment-acquiring"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"s3:*",
					"s3-object-lambda:*"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::payment-acquiring",
					"arn:aws:s3:::payment-acquiring/*"
				]
				"Sid" = "AllowPaymentAcquiringBucketAccess"
			}
		]
	})
}
