# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI:LambdaSecretsManagerReadPolicy"
	to = aws_iam_role_policy.role_dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI_jtsov_policy
}

resource "aws_iam_role_policy" "role_dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI_jtsov_policy" {
	name   = "LambdaSecretsManagerReadPolicy"
	role   = "dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"secretsmanager:GetSecretValue"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:secretsmanager:ap-southeast-1:186375393473:secret:dev-rds-onebank-readonlySecret-veMgCP"
				]
			}
		]
	})
}
