resource "aws_iam_role" "managed_role" {
	name               = "eks-upgrade-backup-role"
	assume_role_policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "backup.amazonaws.com"
      }
    }
  ]
}
EOF

}

resource "aws_iam_role_policy" "managed_policy" {
	name   = "eks-upgrade-backup-role-policy"
	role   = aws_iam_role.managed_role.id
	policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "eks:CreateAccessEntry",
        "eks:DeleteAccessEntry",
        "eks:DescribeCluster",
        "eks:DescribeAccessEntry",
        "eks:ListAccessEntries"
      ],
      "Resource": [
        "arn:aws:eks:ap-southeast-1:186375393473:cluster/agentic-commerce-prod-cluster"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "backup:DescribeBackupVaults",
        "backup:CreateRecoveryPoint",
        "ec2:DescribeVolumes",
        "ec2:CreateSnapshot",
        "ec2:DeleteSnapshot",
        "ec2:DescribeSnapshots",
        "ec2:CreateTags"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF

}
