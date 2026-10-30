# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "rds-monitoring-role/arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
	to = aws_iam_role_policy_attachment.attachment_role_rds-monitoring-role_service-role_AmazonRDSEnhancedMonitoringRole
}

resource "aws_iam_role_policy_attachment" "attachment_role_rds-monitoring-role_service-role_AmazonRDSEnhancedMonitoringRole" {
	role       = "rds-monitoring-role"
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}
