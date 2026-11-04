# First-time adoption: import the pre-existing role into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "CloudTrailRoleForCloudWatchLogs_management-events"
	to = aws_iam_role.role_CloudTrailRoleForCloudWatchLogs_management-events
}

resource "aws_iam_role" "role_CloudTrailRoleForCloudWatchLogs_management-events" {
	name                 = "CloudTrailRoleForCloudWatchLogs_management-events"
	assume_role_policy   = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Condition" = {
					"StringEquals" = {
						"aws:SourceAccount" = "186375393473"
						"aws:SourceArn" = "arn:aws:cloudtrail:ap-southeast-1:186375393473:trail/management-events"
					}
				}
				"Effect" = "Allow"
				"Principal" = {
					"Service" = "cloudtrail.amazonaws.com"
				}
			}
		]
	})
	path                 = "/service-role/"
	description          = "Role for config CloudWathLogs for trail management-events"
	max_session_duration = 3600
}
