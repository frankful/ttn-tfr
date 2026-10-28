# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "BedrockAPIKey-shtw"
	to = aws_iam_user.user_BedrockAPIKey-shtw
}

resource "aws_iam_user" "user_BedrockAPIKey-shtw" {
	name = "BedrockAPIKey-shtw"
	path = "/"
}
