# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI:LambdaLoggingPolicy"
	to = aws_iam_role_policy.role_dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI_hhskd_policy
}

resource "aws_iam_role_policy" "role_dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI_hhskd_policy" {
	name   = "LambdaLoggingPolicy"
	role   = "dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"logs:CreateLogGroup",
					"logs:CreateLogStream",
					"logs:PutLogEvents"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/aws/lambda/dev-rds-onebank-readonly:*"
				]
			}
		]
	})
}
