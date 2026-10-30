# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "workspaces_DefaultRole:AmazonWorkSpacesPoolServiceAccess"
	to = aws_iam_role_policy.role_workspaces_DefaultRole_mfrdu_policy
}

resource "aws_iam_role_policy" "role_workspaces_DefaultRole_mfrdu_policy" {
	name   = "AmazonWorkSpacesPoolServiceAccess"
	role   = "workspaces_DefaultRole"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"ec2:DescribeVpcs",
					"ec2:DescribeSubnets",
					"ec2:DescribeAvailabilityZones",
					"ec2:DescribeSecurityGroups",
					"ec2:DescribeRouteTables",
					"s3:ListAllMyBuckets"
				]
				"Condition" = {
					"StringEquals" = {
						"aws:ResourceAccount" = "$${aws:PrincipalAccount}"
					}
				}
				"Effect" = "Allow"
				"Resource" = "*"
			},
			{
				"Action" = [
					"s3:CreateBucket",
					"s3:ListBucket",
					"s3:GetObject",
					"s3:PutObject",
					"s3:DeleteObject",
					"s3:GetObjectVersion",
					"s3:DeleteObjectVersion",
					"s3:GetBucketPolicy",
					"s3:PutBucketPolicy",
					"s3:PutEncryptionConfiguration"
				]
				"Condition" = {
					"StringEquals" = {
						"aws:ResourceAccount" = "$${aws:PrincipalAccount}"
					}
				}
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:s3:::wspool-logs-*",
					"arn:aws:s3:::wspool-app-settings-*",
					"arn:aws:s3:::wspool-home-folder-*"
				]
			}
		]
	})
}
