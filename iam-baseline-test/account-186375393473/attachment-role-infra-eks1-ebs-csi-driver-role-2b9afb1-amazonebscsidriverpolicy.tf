# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "infra-eks1-ebs-csi-driver-role-2b9afb1/arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_infra-eks1-ebs-csi-driver-role-2b9afb1_service-role_AmazonEBSCSIDriverPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_infra-eks1-ebs-csi-driver-role-2b9afb1_service-role_AmazonEBSCSIDriverPolicy" {
	role       = "infra-eks1-ebs-csi-driver-role-2b9afb1"
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}
