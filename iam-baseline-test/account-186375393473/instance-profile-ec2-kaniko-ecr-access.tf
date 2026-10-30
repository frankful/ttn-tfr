# First-time adoption: import the pre-existing instance profile into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "ec2-kaniko-ecr-access"
	to = aws_iam_instance_profile.instance_profile_ec2-kaniko-ecr-access
}

resource "aws_iam_instance_profile" "instance_profile_ec2-kaniko-ecr-access" {
	name = "ec2-kaniko-ecr-access"
	role = "ec2-kaniko-ecr-access"
}
