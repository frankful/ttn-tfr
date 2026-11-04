# First-time adoption: import the pre-existing policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:policy/infra-eks1-ClusterAutoscalerPolicy"
	to = aws_iam_policy.managed_policy_infra-eks1-ClusterAutoscalerPolicy
}

resource "aws_iam_policy" "managed_policy_infra-eks1-ClusterAutoscalerPolicy" {
	name   = "infra-eks1-ClusterAutoscalerPolicy"
	path   = "/"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"autoscaling:DescribeAutoScalingGroups",
					"autoscaling:DescribeAutoScalingInstances",
					"autoscaling:DescribeLaunchConfigurations",
					"autoscaling:DescribeScalingActivities",
					"ec2:DescribeImages",
					"ec2:DescribeInstanceTypes",
					"ec2:DescribeLaunchTemplateVersions",
					"ec2:GetInstanceTypesFromInstanceRequirements",
					"eks:DescribeNodegroup"
				]
				"Effect" = "Allow"
				"Resource" = [
					"*"
				]
			},
			{
				"Action" = [
					"autoscaling:SetDesiredCapacity",
					"autoscaling:TerminateInstanceInAutoScalingGroup"
				]
				"Effect" = "Allow"
				"Resource" = [
					"*"
				]
			}
		]
	})
	tags = {
		"Owner" = "platform-team"
	}
}
