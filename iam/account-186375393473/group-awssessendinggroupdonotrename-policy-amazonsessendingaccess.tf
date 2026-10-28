# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "AWSSESSendingGroupDoNotRename:AmazonSesSendingAccess"
	to = aws_iam_group_policy.group_AWSSESSendingGroupDoNotRename_jvojc_AmazonSesSendingAccess
}

resource "aws_iam_group_policy" "group_AWSSESSendingGroupDoNotRename_jvojc_AmazonSesSendingAccess" {
	name   = "AmazonSesSendingAccess"
	group   = "AWSSESSendingGroupDoNotRename"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "ses:SendRawEmail"
				"Effect" = "Allow"
				"Resource" = "*"
			}
		]
	})
}
