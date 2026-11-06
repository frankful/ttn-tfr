resource "aws_iam_role" "role_pubtest-role" {
	name               = "pubtest-role"
	assume_role_policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRole"
				"Effect" = "Allow"
				"Principal" = {
					"AWS" = "arn:aws:iam::186375393473:root"
				}
			}
		]
	})
	path               = "/"
	description        = "public release acceptance test role"
}

resource "aws_iam_role_policy_attachment" "attachment_role_pubtest-role_ReadOnlyAccess" {
	role       = "pubtest-role"
	policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
