# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "gitlab-only/gitlab-snapshot-manager"
	to = aws_iam_group_policy_attachment.managed_attachment
}

resource "aws_iam_group_policy_attachment" "managed_attachment" {
	group      = "gitlab-only"
	policy_arn = "arn:aws:iam::186375393473:policy/gitlab-snapshot-manager"
}
