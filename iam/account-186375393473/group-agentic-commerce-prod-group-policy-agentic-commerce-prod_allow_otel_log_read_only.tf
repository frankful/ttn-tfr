# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-group/agentic-commerce-prod_allow_otel_log_read_only"
	to = aws_iam_group_policy.inline_policy
}

resource "aws_iam_group_policy" "inline_policy" {
	name   = "agentic-commerce-prod_allow_otel_log_read_only"
	group  = "agentic-commerce-prod-group"
	policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowConsoleListAllGroups",
      "Action": [
        "logs:DescribeLogGroups"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "StrictLimitReadContentToOtelOnly",
      "Action": [
        "logs:GetLogEvents",
        "logs:FilterLogEvents",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm-prd/app",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm-prd/metrics",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm-prd/app:*",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm-prd/metrics:*",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/app",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/metrics",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/app:*",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/metrics:*"
      ]
    },
    {
      "Sid": "AllowCloudWatchMetricsReadOnly",
      "Action": [
        "cloudwatch:ListMetrics",
        "cloudwatch:GetMetricStatistics",
        "cloudwatch:GetMetricData",
        "cloudwatch:DescribeAlarms"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "AllowXrayTraceReadOnly",
      "Action": [
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
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "AllowLogsInsightsQuery",
      "Action": [
        "logs:StartQuery",
        "logs:StopQuery",
        "logs:DescribeQueries",
        "logs:GetLogGroupFields",
        "logs:GetLogRecord",
        "logs:GetQueryResults"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm-prd/app",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm-prd/metrics",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm-prd/app:*",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/acm-prd/metrics:*",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/app",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/metrics",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/app:*",
        "arn:aws:logs:ap-southeast-1:186375393473:log-group:/tac-prd/metrics:*"
      ]
    }
  ]
}
EOF

}
