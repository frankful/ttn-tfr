resource "aws_iam_user" "user_ci-e2e-test" {
	name = "ci-e2e-test"
	path = "/"
}
