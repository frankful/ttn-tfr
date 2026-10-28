# First-time adoption: import the pre-existing policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:policy/service-role/Cloudtrail-CW-access-policy-management-events-518d361d-85e5-409d-9682-676d1734f17a"
	to = aws_iam_policy.managed_policy_Cloudtrail-CW-access-policy-management-events-518d361d-85e5-409d-9682-676d1734f17a
}

resource "aws_iam_policy" "managed_policy_Cloudtrail-CW-access-policy-management-events-518d361d-85e5-409d-9682-676d1734f17a" {
	name   = "Cloudtrail-CW-access-policy-management-events-518d361d-85e5-409d-9682-676d1734f17a"
	path   = "/service-role/"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"logs:CreateLogStream"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:CloudTrail/management-events:log-stream:186375393473_CloudTrail_ap-southeast-1*"
				]
				"Sid" = "AWSCloudTrailCreateLogStream2014110"
			},
			{
				"Action" = [
					"logs:PutLogEvents"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:logs:ap-southeast-1:186375393473:log-group:CloudTrail/management-events:log-stream:186375393473_CloudTrail_ap-southeast-1*"
				]
				"Sid" = "AWSCloudTrailPutLogEvents20141101"
			}
		]
	})
	description = "Policy for config CloudWathLogs for trail management-events, created by CloudTrail console"
}
