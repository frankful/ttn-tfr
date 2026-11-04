# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "cloudwatch-payment-dev:cloudwatch-payment-dev-policy"
	to = aws_iam_group_policy.group_cloudwatch-payment-dev_tsmpq_cloudwatch-payment-dev-policy
}

resource "aws_iam_group_policy" "group_cloudwatch-payment-dev_tsmpq_cloudwatch-payment-dev-policy" {
	name   = "cloudwatch-payment-dev-policy"
	group   = "cloudwatch-payment-dev"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"logs:DescribeLogGroups"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowDescribeLogGroupsGlobal"
			},
			{
				"Action" = [
					"logs:ListSyslogConfigurations"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowListSyslogConfigurationsGlobal"
			},
			{
				"Action" = [
					"observabilityadmin:ListTelemetryRules",
					"observabilityadmin:ListTelemetryPipelines"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowObservabilityAdminListTelemetry"
			},
			{
				"Action" = [
					"logs:DescribeLogGroups",
					"logs:DescribeLogStreams",
					"logs:GetLogEvents",
					"logs:FilterLogEvents",
					"logs:StartQuery",
					"logs:StopQuery",
					"logs:DescribeQueries",
					"logs:GetLogGroupFields",
					"logs:GetLogRecord",
					"logs:GetQueryResults"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-dev/logs",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-dev/logs:*"
				]
				"Sid" = "AllowReadOnlyForKnownNonProdLogGroups"
			},
			{
				"Action" = [
					"cloudwatch:ListMetrics",
					"cloudwatch:GetMetricStatistics",
					"cloudwatch:GetMetricData",
					"cloudwatch:DescribeAlarms"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowCloudWatchMetricsReadOnly"
			},
			{
				"Action" = [
					"xray:GetTraceSummaries",
					"xray:GetTraceGraph",
					"xray:GetTrace",
					"xray:BatchGetTraces",
					"xray:ListGroups",
					"xray:ListServices",
					"xray:ListRetrievalTraces",
					"xray:GetDistinctTraceGraphs",
					"xray:GetServiceGraph",
					"xray:GetRetrievedTracesGraph",
					"xray:GetTimeSeriesServiceStatistics"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowXrayTraceReadOnly"
			}
		]
	})
}
