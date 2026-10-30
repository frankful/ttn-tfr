# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "gitlab-only:gitlab-backup-s3"
	to = aws_iam_group_policy.group_gitlab-only_zsauh_gitlab-backup-s3
}

resource "aws_iam_group_policy" "group_gitlab-only_zsauh_gitlab-backup-s3" {
	name   = "gitlab-backup-s3"
	group   = "gitlab-only"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"s3:ListAllMyBuckets",
					"s3:GetBucketLocation"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::*"
				]
				"Sid" = "AllowStatement1"
			},
			{
				"Action" = [
					"s3:ListBucket"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::ttn-gitlab-bak"
				]
				"Sid" = "AllowListGitLabBakBucket"
			},
			{
				"Action" = [
					"s3:*"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::ttn-gitlab-bak/*"
				]
				"Sid" = "AllowFullAccessToGitLabBakObjects"
			}
		]
	})
}
