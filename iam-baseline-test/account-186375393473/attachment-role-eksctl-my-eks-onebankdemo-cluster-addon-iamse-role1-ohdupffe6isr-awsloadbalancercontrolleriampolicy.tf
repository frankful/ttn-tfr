# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-OhDUPffe6ISr/arn:aws:iam::186375393473:policy/AWSLoadBalancerControllerIAMPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-OhDUPffe6ISr_AWSLoadBalancerControllerIAMPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-OhDUPffe6ISr_AWSLoadBalancerControllerIAMPolicy" {
	role       = "eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-OhDUPffe6ISr"
	policy_arn = "arn:aws:iam::186375393473:policy/AWSLoadBalancerControllerIAMPolicy"
}
