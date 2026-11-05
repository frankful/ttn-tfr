resource "aws_iam_user" "user_ci-e2e-fail" {
	name = "ci-e2e-fail"
	path = "/"
}
