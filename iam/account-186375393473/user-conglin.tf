# First-time adoption: import the pre-existing IAM user into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "conglin"
	to = aws_iam_user.user_conglin
}

resource "aws_iam_user" "user_conglin" {
	name = "conglin"
	path = "/"
}
