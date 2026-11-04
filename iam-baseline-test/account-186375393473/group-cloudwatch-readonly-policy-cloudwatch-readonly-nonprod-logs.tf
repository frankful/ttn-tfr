# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "cloudwatch-readonly:cloudwatch-readonly-nonprod-logs"
	to = aws_iam_group_policy.group_cloudwatch-readonly_xzbyp_cloudwatch-readonly-nonprod-logs
}

resource "aws_iam_group_policy" "group_cloudwatch-readonly_xzbyp_cloudwatch-readonly-nonprod-logs" {
	name   = "cloudwatch-readonly-nonprod-logs"
	group   = "cloudwatch-readonly"
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
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm/app",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm/app:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm/metrics",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm/metrics:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/onebank/logs",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/onebank/logs:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/onebank/metrics",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/onebank/metrics:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:core-server",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:core-server:*"
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
