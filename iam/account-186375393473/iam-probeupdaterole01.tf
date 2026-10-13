resource "aws_iam_role" "managed_role" {
	name               = "AWS-QuickSetup-JITNA-LocalAdministrationRole"
	assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"aws:SourceAccount\":\"186375393473\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"cloudformation.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
	description        = "e2e update-role probe (condition narrowed)"
}
