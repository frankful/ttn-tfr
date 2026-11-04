# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "acm-prd-bedrock/arn:aws:iam::aws:policy/AmazonBedrockFullAccess"
	to = aws_iam_user_policy_attachment.attachment_user_acm-prd-bedrock_AmazonBedrockFullAccess
}

resource "aws_iam_user_policy_attachment" "attachment_user_acm-prd-bedrock_AmazonBedrockFullAccess" {
	user       = "acm-prd-bedrock"
	policy_arn = "arn:aws:iam::aws:policy/AmazonBedrockFullAccess"
}
