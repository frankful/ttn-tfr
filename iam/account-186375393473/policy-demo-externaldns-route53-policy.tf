# First-time adoption: import the pre-existing policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:policy/demo-ExternalDNS-Route53-Policy"
	to = aws_iam_policy.managed_policy_demo-ExternalDNS-Route53-Policy
}

resource "aws_iam_policy" "managed_policy_demo-ExternalDNS-Route53-Policy" {
	name   = "demo-ExternalDNS-Route53-Policy"
	path   = "/"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"route53:ChangeResourceRecordSets"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:route53:::hostedzone/Z0533378WY40CQOZ5BW1"
				]
			},
			{
				"Action" = [
					"route53:ListHostedZones",
					"route53:ListResourceRecordSets",
					"route53:ListTagsForResource",
					"route53:GetChange"
				]
				"Effect" = "Allow"
				"Resource" = [
					"*"
				]
			}
		]
	})
}
