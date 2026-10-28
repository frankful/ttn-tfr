# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "atsec-scan:atsec-scan-tmp"
	to = aws_iam_user_policy.user_atsec-scan_dtaxq_atsec-scan-tmp
}

resource "aws_iam_user_policy" "user_atsec-scan_dtaxq_atsec-scan-tmp" {
	name   = "atsec-scan-tmp"
	user   = "atsec-scan"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"ssm:StartSession",
					"ssm:TerminateSession",
					"ssm:ResumeSession"
				]
				"Condition" = {
					"StringEquals" = {
						"ssm:resourceTag/Environment" = [
							"payment-acquiring-prod"
						]
					}
				}
				"Effect" = "Allow"
				"Resource" = "arn:aws:ec2:ap-southeast-1:186375393473:instance/*"
				"Sid" = "AllowSSMSessionOnTaggedEC2"
			},
			{
				"Action" = [
					"ssm:TerminateSession",
					"ssm:ResumeSession"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:ssm:ap-southeast-1:186375393473:session/*"
				"Sid" = "AllowSSMTerminateResumeSession"
			},
			{
				"Action" = [
					"ssm:StartSession",
					"ssm:TerminateSession",
					"ssm:ResumeSession"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:ssm:ap-southeast-1:*:document/SSM-SessionManagerRunShell",
					"arn:aws:ssm:ap-southeast-1:*:document/AWS-StartPortForwardingSession",
					"arn:aws:ssm:ap-southeast-1:*:document/AWS-StartPortForwardingSessionToRemoteHost"
				]
				"Sid" = "AllowSSMDocuments"
			},
			{
				"Action" = [
					"ec2:DescribeInstances",
					"ssm:DescribeSessions",
					"ssm:GetConnectionStatus"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowDescribeForSSM"
			}
		]
	})
}
