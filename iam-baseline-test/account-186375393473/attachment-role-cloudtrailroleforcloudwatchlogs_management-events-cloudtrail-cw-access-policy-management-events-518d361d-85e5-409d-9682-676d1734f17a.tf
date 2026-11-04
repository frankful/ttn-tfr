# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "CloudTrailRoleForCloudWatchLogs_management-events/arn:aws:iam::186375393473:policy/service-role/Cloudtrail-CW-access-policy-management-events-518d361d-85e5-409d-9682-676d1734f17a"
	to = aws_iam_role_policy_attachment.attachment_role_CloudTrailRoleForCloudWatchLogs_management-events_service-role_Cloudtrail-CW-access-policy-management-events-518d361d-85e5-409d-9682-676d1734f17a
}

resource "aws_iam_role_policy_attachment" "attachment_role_CloudTrailRoleForCloudWatchLogs_management-events_service-role_Cloudtrail-CW-access-policy-management-events-518d361d-85e5-409d-9682-676d1734f17a" {
	role       = "CloudTrailRoleForCloudWatchLogs_management-events"
	policy_arn = "arn:aws:iam::186375393473:policy/service-role/Cloudtrail-CW-access-policy-management-events-518d361d-85e5-409d-9682-676d1734f17a"
}
