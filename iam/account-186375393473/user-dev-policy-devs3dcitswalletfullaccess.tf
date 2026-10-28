# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "dev:DevS3DcitsWalletFullAccess"
	to = aws_iam_user_policy.user_dev_dnkyk_DevS3DcitsWalletFullAccess
}

resource "aws_iam_user_policy" "user_dev_dnkyk_DevS3DcitsWalletFullAccess" {
	name   = "DevS3DcitsWalletFullAccess"
	user   = "dev"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "s3:*"
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::dcits-wallet",
					"arn:aws:s3:::dcits-wallet/*"
				]
			}
		]
	})
}
