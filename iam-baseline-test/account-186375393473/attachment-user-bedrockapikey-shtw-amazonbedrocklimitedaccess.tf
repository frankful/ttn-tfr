# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "BedrockAPIKey-shtw/arn:aws:iam::aws:policy/AmazonBedrockLimitedAccess"
	to = aws_iam_user_policy_attachment.attachment_user_BedrockAPIKey-shtw_AmazonBedrockLimitedAccess
}

resource "aws_iam_user_policy_attachment" "attachment_user_BedrockAPIKey-shtw_AmazonBedrockLimitedAccess" {
	user       = "BedrockAPIKey-shtw"
	policy_arn = "arn:aws:iam::aws:policy/AmazonBedrockLimitedAccess"
}
