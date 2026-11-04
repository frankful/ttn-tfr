# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "SRETeam/arn:aws:iam::aws:policy/AmazonWorkSpacesAdmin"
	to = aws_iam_group_policy_attachment.attachment_group_SRETeam_AmazonWorkSpacesAdmin
}

resource "aws_iam_group_policy_attachment" "attachment_group_SRETeam_AmazonWorkSpacesAdmin" {
	group      = "SRETeam"
	policy_arn = "arn:aws:iam::aws:policy/AmazonWorkSpacesAdmin"
}
