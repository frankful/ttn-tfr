# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "gitlab"
	to = aws_iam_user.user_gitlab
}

resource "aws_iam_user" "user_gitlab" {
	name = "gitlab"
	path = "/"
	tags = {
		"AKIASWZGW2DAYVZHRSSH" = "gitlab-backup"
	}
}
