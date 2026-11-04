# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-ufJUe4RIX9Ll/arn:aws:iam::186375393473:policy/demo-ExternalDNS-Route53-Policy"
	to = aws_iam_role_policy_attachment.attachment_role_eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-ufJUe4RIX9Ll_demo-ExternalDNS-Route53-Policy
}

resource "aws_iam_role_policy_attachment" "attachment_role_eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-ufJUe4RIX9Ll_demo-ExternalDNS-Route53-Policy" {
	role       = "eksctl-my-eks-onebankdemo-cluster-addon-iamse-Role1-ufJUe4RIX9Ll"
	policy_arn = "arn:aws:iam::186375393473:policy/demo-ExternalDNS-Route53-Policy"
}
