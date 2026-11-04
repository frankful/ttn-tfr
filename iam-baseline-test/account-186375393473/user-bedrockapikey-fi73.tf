# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "BedrockAPIKey-fi73"
	to = aws_iam_user.user_BedrockAPIKey-fi73
}

resource "aws_iam_user" "user_BedrockAPIKey-fi73" {
	name = "BedrockAPIKey-fi73"
	path = "/"
}
