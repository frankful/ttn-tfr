# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-group:payment-acquiring-prod_allow_otel_log_read_only"
	to = aws_iam_group_policy.group_payment-acquiring-prod-group_mhopv_payment-acquiring-prod_allow_otel_log_read_only
}

resource "aws_iam_group_policy" "group_payment-acquiring-prod-group_mhopv_payment-acquiring-prod_allow_otel_log_read_only" {
	name   = "payment-acquiring-prod_allow_otel_log_read_only"
	group   = "payment-acquiring-prod-group"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"logs:DescribeLogGroups"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowConsoleListAllGroups"
			},
			{
				"Action" = [
					"logs:GetLogEvents",
					"logs:FilterLogEvents",
					"logs:DescribeLogStreams"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/aws/payment-acquiring-prod/eks",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/metrics",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/logs",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/logs:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/metrics:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/aws/payment-acquiring-prod/eks:*"
				]
				"Sid" = "StrictLimitReadContentToOtelOnly"
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
			},
			{
				"Action" = [
					"logs:StartQuery",
					"logs:StopQuery",
					"logs:DescribeQueries",
					"logs:GetLogGroupFields",
					"logs:GetLogRecord",
					"logs:GetQueryResults"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/aws/payment-acquiring-prod/eks",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/metrics",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/logs",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/logs:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/otel/payment-acquiring-prod/metrics:*",
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:/aws/payment-acquiring-prod/eks:*"
				]
				"Sid" = "AllowLogsInsightsQuery"
			}
		]
	})
}
