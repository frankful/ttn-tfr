# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "acm-speech-dev"
	to = aws_iam_group.group_acm-speech-dev
}

resource "aws_iam_group" "group_acm-speech-dev" {
	name = "acm-speech-dev"
	path = "/"
}
