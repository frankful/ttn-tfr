# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-group:payment-acquiring-prod-eks-ssm-session-policy"
	to = aws_iam_group_policy.group_payment-acquiring-prod-group_qscsa_payment-acquiring-prod-eks-ssm-session-policy
}

resource "aws_iam_group_policy" "group_payment-acquiring-prod-group_qscsa_payment-acquiring-prod-eks-ssm-session-policy" {
	name   = "payment-acquiring-prod-eks-ssm-session-policy"
	group   = "payment-acquiring-prod-group"
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
				"Action" = [
					"ssm:StartSession",
					"ssm:TerminateSession",
					"ssm:ResumeSession"
				]
				"Condition" = {
					"Bool" = {
						"aws:MultiFactorAuthPresent" = true
					}
					"StringEquals" = {
						"ssm:resourceTag/Environment" = [
							"payment-acquiring-prod"
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
				"Action" = [
					"ssm:StartSession",
					"ssm:TerminateSession",
					"ssm:ResumeSession"
				]
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
