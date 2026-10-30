# First-time adoption: import the pre-existing IAM group into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "SRETeam"
	to = aws_iam_group.group_SRETeam
}

resource "aws_iam_group" "group_SRETeam" {
	name = "SRETeam"
	path = "/"
}

import {
	id = "SRETeam/arn:aws:iam::aws:policy/AdministratorAccess"
	to = aws_iam_group_policy_attachment.attachment_group_SRETeam_AdministratorAccess
}

resource "aws_iam_group_policy_attachment" "attachment_group_SRETeam_AdministratorAccess" {
	group      = "SRETeam"
	policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

import {
	id = "SRETeam/arn:aws:iam::aws:policy/AmazonWorkSpacesAdmin"
	to = aws_iam_group_policy_attachment.attachment_group_SRETeam_AmazonWorkSpacesAdmin
}

resource "aws_iam_group_policy_attachment" "attachment_group_SRETeam_AmazonWorkSpacesAdmin" {
	group      = "SRETeam"
	policy_arn = "arn:aws:iam::aws:policy/AmazonWorkSpacesAdmin"
}

import {
	id = "SRETeam/arn:aws:iam::aws:policy/AmazonWorkSpacesServiceAccess"
	to = aws_iam_group_policy_attachment.attachment_group_SRETeam_AmazonWorkSpacesServiceAccess
}

resource "aws_iam_group_policy_attachment" "attachment_group_SRETeam_AmazonWorkSpacesServiceAccess" {
	group      = "SRETeam"
	policy_arn = "arn:aws:iam::aws:policy/AmazonWorkSpacesServiceAccess"
}
