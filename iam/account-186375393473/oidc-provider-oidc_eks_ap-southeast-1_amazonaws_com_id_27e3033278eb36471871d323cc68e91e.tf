# First-time adoption: import the pre-existing OIDC provider into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/27E3033278EB36471871D323CC68E91E"
	to = aws_iam_openid_connect_provider.identity_provider_https___oidc_eks_ap-southeast-1_amazonaws_com_id_27E3033278EB36471871D323CC68E91E
}

resource "aws_iam_openid_connect_provider" "identity_provider_https___oidc_eks_ap-southeast-1_amazonaws_com_id_27E3033278EB36471871D323CC68E91E" {
	url             = "https://oidc.eks.ap-southeast-1.amazonaws.com/id/27E3033278EB36471871D323CC68E91E"
	client_id_list  = ["sts.amazonaws.com"]
	thumbprint_list = ["06b25927c42a721631c1efd9431e648fa62e1e39"]
}
