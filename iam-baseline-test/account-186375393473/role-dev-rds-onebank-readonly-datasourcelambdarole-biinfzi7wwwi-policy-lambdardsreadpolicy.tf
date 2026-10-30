# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI:LambdaRDSReadPolicy"
	to = aws_iam_role_policy.role_dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI_duoze_policy
}

resource "aws_iam_role_policy" "role_dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI_duoze_policy" {
	name   = "LambdaRDSReadPolicy"
	role   = "dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"rds:DescribeDBInstances"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			}
		]
	})
}
