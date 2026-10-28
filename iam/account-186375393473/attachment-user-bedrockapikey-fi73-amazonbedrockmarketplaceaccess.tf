# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "BedrockAPIKey-fi73/arn:aws:iam::aws:policy/AmazonBedrockMarketplaceAccess"
	to = aws_iam_user_policy_attachment.attachment_user_BedrockAPIKey-fi73_AmazonBedrockMarketplaceAccess
}

resource "aws_iam_user_policy_attachment" "attachment_user_BedrockAPIKey-fi73_AmazonBedrockMarketplaceAccess" {
	user       = "BedrockAPIKey-fi73"
	policy_arn = "arn:aws:iam::aws:policy/AmazonBedrockMarketplaceAccess"
}
