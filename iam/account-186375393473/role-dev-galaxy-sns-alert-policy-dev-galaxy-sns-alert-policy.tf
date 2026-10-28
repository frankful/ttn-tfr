# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "dev-galaxy-sns-alert:dev-galaxy-sns-alert-policy"
	to = aws_iam_role_policy.role_dev-galaxy-sns-alert_neghs_policy
}

resource "aws_iam_role_policy" "role_dev-galaxy-sns-alert_neghs_policy" {
	name   = "dev-galaxy-sns-alert-policy"
	role   = "dev-galaxy-sns-alert"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"sns:Publish"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:sns:ap-southeast-1:186375393473:Workspace_Alarm_Topic"
				]
			}
		]
	})
}
