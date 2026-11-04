# First-time adoption: import the pre-existing OIDC provider into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/931EFD92F732AAAE7F9FB24C49BDAC11"
	to = aws_iam_openid_connect_provider.identity_provider_https___oidc_eks_ap-southeast-1_amazonaws_com_id_931EFD92F732AAAE7F9FB24C49BDAC11
}

resource "aws_iam_openid_connect_provider" "identity_provider_https___oidc_eks_ap-southeast-1_amazonaws_com_id_931EFD92F732AAAE7F9FB24C49BDAC11" {
	url             = "https://oidc.eks.ap-southeast-1.amazonaws.com/id/931EFD92F732AAAE7F9FB24C49BDAC11"
	client_id_list  = ["sts.amazonaws.com"]
	thumbprint_list = ["06b25927c42a721631c1efd9431e648fa62e1e39"]
}
