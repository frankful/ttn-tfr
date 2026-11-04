# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "Transcribe-Polly-dev-group"
	to = aws_iam_group.group_Transcribe-Polly-dev-group
}

resource "aws_iam_group" "group_Transcribe-Polly-dev-group" {
	name = "Transcribe-Polly-dev-group"
	path = "/"
}
