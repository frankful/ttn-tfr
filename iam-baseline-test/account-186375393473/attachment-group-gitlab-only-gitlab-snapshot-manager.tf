# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "gitlab-only/arn:aws:iam::186375393473:policy/gitlab-snapshot-manager"
	to = aws_iam_group_policy_attachment.attachment_group_gitlab-only_gitlab-snapshot-manager
}

resource "aws_iam_group_policy_attachment" "attachment_group_gitlab-only_gitlab-snapshot-manager" {
	group      = "gitlab-only"
	policy_arn = "arn:aws:iam::186375393473:policy/gitlab-snapshot-manager"
}
