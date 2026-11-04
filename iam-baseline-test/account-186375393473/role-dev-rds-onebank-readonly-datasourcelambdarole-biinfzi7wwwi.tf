# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI"
	to = aws_iam_role.role_dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI
}

resource "aws_iam_role" "role_dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI" {
	name                 = "dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Principal" = {
					"Service" = "lambda.amazonaws.com"
				}
			}
		]
	})
	path                 = "/"
	max_session_duration = 3600
}
