# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-aws-lbc-role/arn:aws:iam::186375393473:policy/payment-acquiring-prod-AWSLoadBalancerControllerIAMPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_payment-acquiring-prod-aws-lbc-role_payment-acquiring-prod-AWSLoadBalancerControllerIAMPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_payment-acquiring-prod-aws-lbc-role_payment-acquiring-prod-AWSLoadBalancerControllerIAMPolicy" {
	role       = "payment-acquiring-prod-aws-lbc-role"
	policy_arn = "arn:aws:iam::186375393473:policy/payment-acquiring-prod-AWSLoadBalancerControllerIAMPolicy"
}
