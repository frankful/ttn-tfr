# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "gitlab-only/gitlab-backup-s3"
	to = aws_iam_group_policy.inline_policy
}

resource "aws_iam_group_policy" "inline_policy" {
	name   = "gitlab-backup-s3"
	group  = "gitlab-only"
	policy = "{\"Version\": \"2012-10-17\", \"Statement\": [{\"Action\": [\"s3:GetObject\"], \"Effect\": \"Allow\", \"Resource\": [\"arn:aws:s3:::gitlab-snapshot/*\"]}]}"
}
