resource "aws_iam_role" "managed_role" {
	name               = "e2e-frontend-role"
	assume_role_policy = "{\"Version\": \"2012-10-17\", \"Statement\": [{\"Action\": \"sts:AssumeRole\", \"Effect\": \"Allow\", \"Principal\": {\"AWS\": [\"arn:aws:iam::186375393473:root\"]}}]}"
}

resource "aws_iam_role_policy" "managed_policy" {
	name   = "e2e-frontend-role-policy"
	role   = aws_iam_role.managed_role.id
	policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"iam:GetRole\"\n      ],\n      \"Resource\": [\n        \"arn:aws:iam::186375393473:role/e2e-frontend-role\"\n      ]\n    }\n  ]\n}"
}
