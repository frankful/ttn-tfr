# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "AWSSESSendingGroupDoNotRename"
	to = aws_iam_group.group_AWSSESSendingGroupDoNotRename
}

resource "aws_iam_group" "group_AWSSESSendingGroupDoNotRename" {
	name = "AWSSESSendingGroupDoNotRename"
	path = "/"
}
