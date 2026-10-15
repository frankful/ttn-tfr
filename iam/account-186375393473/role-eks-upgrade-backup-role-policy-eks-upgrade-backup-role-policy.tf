# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "eks-upgrade-backup-role:eks-upgrade-backup-role-policy"
	to = aws_iam_role_policy.inline_policy
}

resource "aws_iam_role_policy" "inline_policy" {
	name   = "eks-upgrade-backup-role-policy"
	role   = "eks-upgrade-backup-role"
	policy = <<-EOF
{
  "name": "eks-upgrade-backup-policy",
  "statements": [
    {
      "effect": "Allow",
      "actions": [
        "eks:DescribeCluster",
        "eks:ListAccessEntries"
      ],
      "resources": [
        "arn:aws:eks:ap-southeast-1:186375393473:cluster/agentic-commerce-prod-cluster"
      ]
    },
    {
      "effect": "Allow",
      "actions": [
        "eks:CreateAccessEntry",
        "eks:DeleteAccessEntry",
        "eks:DescribeAccessEntry"
      ],
      "resources": [
        "arn:aws:eks:ap-southeast-1:186375393473:access-entry/agentic-commerce-prod-cluster/*"
      ]
    },
    {
      "effect": "Allow",
      "actions": [
        "backup:DescribeBackupVaults",
        "backup:CreateRecoveryPoint",
        "ec2:DescribeVolumes",
        "ec2:CreateSnapshot",
        "ec2:DeleteSnapshot",
        "ec2:DescribeSnapshots",
        "ec2:CreateTags"
      ],
      "resources": [
        "*"
      ]
    }
  ],
  "description": "EKS upgrade backup policy"
}
EOF

}
