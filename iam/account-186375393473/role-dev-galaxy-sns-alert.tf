resource "aws_iam_role" "role_dev-galaxy-sns-alert" {
	name               = "dev-galaxy-sns-alert"
	assume_role_policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = "sts:AssumeRoleWithWebIdentity"
				"Condition" = {
					"StringEquals" = {
						"oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021:aud" = "sts.amazonaws.com"
						"oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021:sub" = "system:serviceaccount:galaxy:alarm-receiver-service"
					}
				}
				"Effect" = "Allow"
				"Principal" = {
					"Federated" = "arn:aws:iam::186375393473:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/C4734F6B2A7D9F9A61C2DA6ED365B021"
				}
				"Sid" = "AllowEksSaAssumeWebIdentity"
			}
		]
	})
}

resource "aws_iam_role_policy" "role_dev-galaxy-sns-alert_policy" {
	name   = "dev-galaxy-sns-alert-policy"
	role   = aws_iam_role.role_dev-galaxy-sns-alert.id
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"sns:Publish"
				]
				"Effect" = "Allow"
				"Resource" = [
					"arn:aws:sns:ap-southeast-1:186375393473:Workspace_Alarm_Topic"
				]
			}
		]
	})
}
