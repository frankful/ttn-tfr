# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "cloudwatch-deveop:cloudwatch-develop"
	to = aws_iam_group_policy.group_cloudwatch-deveop_rfoya_cloudwatch-develop
}

resource "aws_iam_group_policy" "group_cloudwatch-deveop_rfoya_cloudwatch-develop" {
	name   = "cloudwatch-develop"
	group   = "cloudwatch-deveop"
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
					"logs:TestMetricFilter"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowTestMetricFilterGlobal"
			},
			{
				"Action" = [
					"cloudwatch:ListDashboards",
					"cloudwatch:GetDashboard",
					"cloudwatch:PutDashboard",
					"cloudwatch:DeleteDashboards"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowDescribeDashboards"
			},
			{
				"Action" = [
					"logs:PutMetricFilter",
					"logs:DescribeMetricFilters",
					"logs:DeleteMetricFilter",
					"logs:GetTransformer"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/onebank/logs",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/onebank/logs:*"
				]
				"Sid" = "AllowCreateAndTestMetricFilter"
			},
			{
				"Action" = [
					"cloudwatch:ListMetrics",
					"cloudwatch:GetMetricStatistics",
					"cloudwatch:GetMetricData",
					"cloudwatch:DescribeAlarms",
					"cloudwatch:DescribeAlarmsForMetric"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowCloudWatchMetricsReadOnly"
			},
			{
				"Action" = [
					"xray:GetTraceSummaries",
					"xray:GetTraceGraph",
					"xray:BatchGetTraces",
					"xray:GetDistinctTraceGraphs",
					"xray:GetServiceGraph",
					"xray:GetRetrievedTracesGraph",
					"xray:GetTimeSeriesServiceStatistics"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowXrayTraceReadOnly"
			},
			{
				"Action" = [
					"tag:GetResources",
					"tag:GetTagKeys",
					"tag:GetTagValues"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowTagReadOnly"
			}
		]
	})
}
