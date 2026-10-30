# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "tdfos-prod-cluster-ebs-csi-driver-irsa/arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_tdfos-prod-cluster-ebs-csi-driver-irsa_service-role_AmazonEBSCSIDriverPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_tdfos-prod-cluster-ebs-csi-driver-irsa_service-role_AmazonEBSCSIDriverPolicy" {
	role       = "tdfos-prod-cluster-ebs-csi-driver-irsa"
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}
