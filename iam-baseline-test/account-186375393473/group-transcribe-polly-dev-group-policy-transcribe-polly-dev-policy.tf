# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "Transcribe-Polly-dev-group:Transcribe-Polly-dev-policy"
	to = aws_iam_group_policy.group_Transcribe-Polly-dev-group_vgnnr_Transcribe-Polly-dev-policy
}

resource "aws_iam_group_policy" "group_Transcribe-Polly-dev-group_vgnnr_Transcribe-Polly-dev-policy" {
	name   = "Transcribe-Polly-dev-policy"
	group   = "Transcribe-Polly-dev-group"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"transcribe:StartStreamTranscription",
					"transcribe:GetTranscriptionJob",
					"transcribe:StartTranscriptionJob",
					"transcribe:ListTranscriptionJobs",
					"transcribe:CreateVocabulary",
					"transcribe:GetVocabulary",
					"transcribe:UpdateVocabulary",
					"transcribe:ListVocabularies",
					"transcribe:DeleteVocabulary"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			},
			{
				"Action" = [
					"polly:SynthesizeSpeech",
					"polly:DescribeVoices"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			}
		]
	})
}
