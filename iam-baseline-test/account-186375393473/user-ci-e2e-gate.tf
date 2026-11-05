resource "aws_iam_user" "user_ci-e2e-gate" {
	name = "ci-e2e-gate"
	path = "/"
}
