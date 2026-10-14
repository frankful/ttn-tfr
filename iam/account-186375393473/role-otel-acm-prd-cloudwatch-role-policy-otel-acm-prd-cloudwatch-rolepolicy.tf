# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "otel-acm-prd-cloudwatch-role/otel-acm-prd-cloudwatch-rolePolicy"
	to = aws_iam_role_policy.inline_policy
}

resource "aws_iam_role_policy" "inline_policy" {
	name   = "otel-acm-prd-cloudwatch-rolePolicy"
	role   = "otel-acm-prd-cloudwatch-role"
	policy = "{\"Version\": \"2012-10-17\", \"Statement\": [{\"Action\": [\"logs:PutLogEvents\", \"logs:CreateLogStream\", \"logs:DescribeLogStreams\", \"logs:DescribeLogGroups\"], \"Effect\": \"Allow\", \"Resource\": \"*\", \"Condition\": {\"StringEquals\": {\"aws:ResourceTag/project\": \"$${aws:PrincipalTag/project}\"}}}, {\"Action\": [\"xray:PutTraceSegments\", \"xray:PutTelemetryRecords\"], \"Effect\": \"Allow\", \"Resource\": \"*\"}, {\"Action\": [\"ec2:DescribeTags\", \"ec2:DescribeInstances\", \"ec2:DescribeVolumes\"], \"Effect\": \"Allow\", \"Resource\": \"*\"}, {\"Action\": [\"cloudwatch:GetMetricData\", \"cloudwatch:ListMetrics\"], \"Effect\": \"Allow\", \"Resource\": \"*\"}]}"
}
