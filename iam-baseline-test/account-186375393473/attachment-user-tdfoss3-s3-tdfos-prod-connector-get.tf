# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "tdfoss3/arn:aws:iam::186375393473:policy/s3-tdfos-prod-connector-get"
	to = aws_iam_user_policy_attachment.attachment_user_tdfoss3_s3-tdfos-prod-connector-get
}

resource "aws_iam_user_policy_attachment" "attachment_user_tdfoss3_s3-tdfos-prod-connector-get" {
	user       = "tdfoss3"
	policy_arn = "arn:aws:iam::186375393473:policy/s3-tdfos-prod-connector-get"
}
