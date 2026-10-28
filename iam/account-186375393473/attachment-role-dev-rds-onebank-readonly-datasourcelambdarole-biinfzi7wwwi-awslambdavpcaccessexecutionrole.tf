# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI/arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
	to = aws_iam_role_policy_attachment.attachment_role_dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI_service-role_AWSLambdaVPCAccessExecutionRole
}

resource "aws_iam_role_policy_attachment" "attachment_role_dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI_service-role_AWSLambdaVPCAccessExecutionRole" {
	role       = "dev-rds-onebank-readonly-DataSourceLambdaRole-BIinfZI7WWwI"
	policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}
