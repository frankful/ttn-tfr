# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "BedrockAPIKey-shtw/arn:aws:iam::aws:policy/AmazonBedrockMarketplaceAccess"
	to = aws_iam_user_policy_attachment.attachment_user_BedrockAPIKey-shtw_AmazonBedrockMarketplaceAccess
}

resource "aws_iam_user_policy_attachment" "attachment_user_BedrockAPIKey-shtw_AmazonBedrockMarketplaceAccess" {
	user       = "BedrockAPIKey-shtw"
	policy_arn = "arn:aws:iam::aws:policy/AmazonBedrockMarketplaceAccess"
}
