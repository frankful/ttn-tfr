# First-time adoption: import the pre-existing instance profile into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "MyTestEKSNodeRole"
	to = aws_iam_instance_profile.instance_profile_MyTestEKSNodeRole
}

resource "aws_iam_instance_profile" "instance_profile_MyTestEKSNodeRole" {
	name = "MyTestEKSNodeRole"
	role = "MyTestEKSNodeRole"
}
