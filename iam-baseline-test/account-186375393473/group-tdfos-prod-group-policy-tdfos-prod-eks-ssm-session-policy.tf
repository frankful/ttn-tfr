# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "tdfos-prod-group:tdfos-prod-eks-ssm-session-policy"
	to = aws_iam_group_policy.group_tdfos-prod-group_tcivb_tdfos-prod-eks-ssm-session-policy
}

resource "aws_iam_group_policy" "group_tdfos-prod-group_tcivb_tdfos-prod-eks-ssm-session-policy" {
	name   = "tdfos-prod-eks-ssm-session-policy"
	group   = "tdfos-prod-group"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"iam:CreateVirtualMFADevice",
					"iam:DeleteVirtualMFADevice"
				]
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::186375393473:mfa/*"
				"Sid" = "AllowManageOwnMFADeviceResource"
			},
			{
				"Action" = [
					"iam:EnableMFADevice",
					"iam:DeactivateMFADevice",
					"iam:ResyncMFADevice",
					"iam:ListMFADevices"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:iam::186375393473:user/$${aws:username}",
					"arn:aws:iam::186375393473:mfa/*"
				]
				"Sid" = "AllowBindOwnMFADevice"
			},
			{
				"Action" = "iam:ListVirtualMFADevices"
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowListVirtualMFADevices"
			},
			{
				"Action" = "iam:GetLoginProfile"
				"Effect" = "Allow"
				"Resource" = "arn:aws:iam::*:user/$${aws:username}"
				"Sid" = "AllowGetLoginProfile"
			},
			{
				"Action" = [
					"sts:GetSessionToken"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowSTSGetSessionTokenForMFA"
			},
			{
				"Action" = "ssm:StartSession"
				"Condition" = {
					"Bool" = {
						"aws:MultiFactorAuthPresent" = true
					}
					"StringEquals" = {
						"ssm:resourceTag/Environment" = [
							"tdfos-prod"
						]
					}
				}
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:ec2:ap-southeast-1:186375393473:instance/*"
				]
				"Sid" = "AllowSSMSessionOnTaggedEC2"
			},
			{
				"Action" = "ssm:StartSession"
				"Condition" = {
					"Bool" = {
						"aws:MultiFactorAuthPresent" = true
					}
				}
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
					"ssm:TerminateSession",
					"ssm:ResumeSession"
				]
				"Condition" = {
					"Bool" = {
						"aws:MultiFactorAuthPresent" = true
					}
				}
				"Effect" = "Allow"
				"Resource" = "arn:aws:ssm:ap-southeast-1:186375393473:session/$${aws:username}-*"
				"Sid" = "AllowManageOwnSSMSessions"
			},
			{
				"Action" = [
					"ec2:DescribeInstances",
					"ssm:DescribeSessions",
					"ssm:GetConnectionStatus"
				]
				"Condition" = {
					"Bool" = {
						"aws:MultiFactorAuthPresent" = true
					}
				}
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowDescribeForSSM"
			},
			{
				"Action" = [
					"ssmmessages:OpenDataChannel",
					"ssmmessages:OpenControlChannel"
				]
				"Condition" = {
					"Bool" = {
						"aws:MultiFactorAuthPresent" = true
					}
				}
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "AllowSSMDataChannel"
			}
		]
	})
}
