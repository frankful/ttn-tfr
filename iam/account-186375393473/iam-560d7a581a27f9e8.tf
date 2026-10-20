resource "aws_iam_role" "managed_role11" {
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
	role   = aws_iam_role.managed_role11.id
	policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "eks:DescribeCluster",
        "eks:ListAccessEntries",
        "eks:CreateAccessEntry"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:eks:ap-southeast-1:186375393473:cluster/agentic-commerce-prod-cluster"
      ]
    },
    {
      "Action": [
        "eks:DescribeAccessEntry",
        "eks:AssociateAccessPolicy",
        "eks:ListAssociatedAccessPolicies",
        "eks:DisassociateAccessPolicy",
        "eks:DeleteAccessEntry"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    },
    {
      "Action": "iam:PassRole",
      "Effect": "Allow",
      "Resource": "arn:aws:iam::186375393473:role/eks-upgrade-backup-role"
    },
    {
      "Action": [
        "backup:DescribeBackupVaults",
        "backup:CreateRecoveryPoint",
        "ec2:DescribeVolumes",
        "ec2:DescribeTags",
        "ec2:CreateSnapshot",
        "ec2:DeleteSnapshot",
        "ec2:DescribeSnapshots",
        "ec2:CreateTags"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF

}
