# First-time adoption: import the pre-existing policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:policy/Opentelemetry-EKS-Nodes"
	to = aws_iam_policy.managed_policy_Opentelemetry-EKS-Nodes
}

resource "aws_iam_policy" "managed_policy_Opentelemetry-EKS-Nodes" {
	name   = "Opentelemetry-EKS-Nodes"
	path   = "/"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"ec2:DescribeInstances",
					"ec2:DescribeTags",
					"ec2:DescribeVolumes"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			}
		]
	})
}
