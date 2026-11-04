# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-aws-lbc-role/arn:aws:iam::186375393473:policy/agentic-commerce-prod-AWSLoadBalancerControllerIAMPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_agentic-commerce-prod-aws-lbc-role_agentic-commerce-prod-AWSLoadBalancerControllerIAMPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_agentic-commerce-prod-aws-lbc-role_agentic-commerce-prod-AWSLoadBalancerControllerIAMPolicy" {
	role       = "agentic-commerce-prod-aws-lbc-role"
	policy_arn = "arn:aws:iam::186375393473:policy/agentic-commerce-prod-AWSLoadBalancerControllerIAMPolicy"
}
