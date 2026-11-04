# First-time adoption: import the pre-existing OIDC provider into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/C16D848B3D359DC5047B386C3B905A50"
	to = aws_iam_openid_connect_provider.identity_provider_https___oidc_eks_ap-southeast-1_amazonaws_com_id_C16D848B3D359DC5047B386C3B905A50
}

resource "aws_iam_openid_connect_provider" "identity_provider_https___oidc_eks_ap-southeast-1_amazonaws_com_id_C16D848B3D359DC5047B386C3B905A50" {
	url             = "https://oidc.eks.ap-southeast-1.amazonaws.com/id/C16D848B3D359DC5047B386C3B905A50"
	client_id_list  = ["sts.amazonaws.com"]
	thumbprint_list = ["06b25927c42a721631c1efd9431e648fa62e1e39"]
	tags            = {
		"alpha.eksctl.io/cluster-name" = "my-eks-onebankdemo-cluster"
		"alpha.eksctl.io/eksctl-version" = "0.221.0"
	}
}
