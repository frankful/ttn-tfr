# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "iam-readonly:iam-readonly"
	to = aws_iam_user_policy.user_iam-readonly_jpcyz_iam-readonly
}

resource "aws_iam_user_policy" "user_iam-readonly_jpcyz_iam-readonly" {
	name   = "iam-readonly"
	user   = "iam-readonly"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"rolesanywhere:ListTagsForResource",
					"rolesanywhere:ListSubjects",
					"rolesanywhere:ListProfiles",
					"rolesanywhere:ListTrustAnchors",
					"rolesanywhere:GetProfile",
					"rolesanywhere:UntagResource",
					"rolesanywhere:GetTrustAnchor",
					"rolesanywhere:GetSubject",
					"rolesanywhere:TagResource",
					"rolesanywhere:GetCrl",
					"rolesanywhere:ListCrls"
				]
				"Effect" = "Allow"
				"Resource" = "*"
				"Sid" = "VisualEditor0"
			}
		]
	})
}
