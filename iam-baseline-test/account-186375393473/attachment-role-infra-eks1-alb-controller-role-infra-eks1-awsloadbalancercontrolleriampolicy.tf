# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "infra-eks1-alb-controller-role/arn:aws:iam::186375393473:policy/infra-eks1-AWSLoadBalancerControllerIAMPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_infra-eks1-alb-controller-role_infra-eks1-AWSLoadBalancerControllerIAMPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_infra-eks1-alb-controller-role_infra-eks1-AWSLoadBalancerControllerIAMPolicy" {
	role       = "infra-eks1-alb-controller-role"
	policy_arn = "arn:aws:iam::186375393473:policy/infra-eks1-AWSLoadBalancerControllerIAMPolicy"
}
