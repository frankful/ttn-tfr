# First-time adoption: import the pre-existing OIDC provider into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021"
	to = aws_iam_openid_connect_provider.identity_provider_https___oidc_eks_ap-southeast-1_amazonaws_com_id_C4734F6B2A7D9F9A61C2DA6ED365B021
}

resource "aws_iam_openid_connect_provider" "identity_provider_https___oidc_eks_ap-southeast-1_amazonaws_com_id_C4734F6B2A7D9F9A61C2DA6ED365B021" {
	url             = "https://oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021"
	client_id_list  = ["sts.amazonaws.com"]
	thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
}
