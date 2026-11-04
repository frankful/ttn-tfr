# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "guance.chen:lambdaInvokeFunction"
	to = aws_iam_user_policy.user_guance_chen_miqrk_lambdaInvokeFunction
}

resource "aws_iam_user_policy" "user_guance_chen_miqrk_lambdaInvokeFunction" {
	name   = "lambdaInvokeFunction"
	user   = "guance.chen"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"lambda:InvokeFunction",
					"lambda:ListFunctions",
					"lambda:GetFunction"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:lambda:ap-southeast-1:186375393473:function:dev-rds-onebank-readonly"
				]
				"Sid" = "Statement1"
			},
			{
				"Action" = [
					"notifications:ListManagedNotificationEvents"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:notifications::186375393473:managed-notification-configuration/*/*/*/*/event/*"
				]
				"Sid" = "Statement2"
			}
		]
	})
}
