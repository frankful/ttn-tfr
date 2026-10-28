# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "infra-eks1-efs-csi-driver-role-c59cd78/arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_infra-eks1-efs-csi-driver-role-c59cd78_service-role_AmazonEFSCSIDriverPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_infra-eks1-efs-csi-driver-role-c59cd78_service-role_AmazonEFSCSIDriverPolicy" {
	role       = "infra-eks1-efs-csi-driver-role-c59cd78"
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
}
