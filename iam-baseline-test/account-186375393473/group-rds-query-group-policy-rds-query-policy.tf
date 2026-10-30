# First-time adoption: import the pre-existing inline policy into
# Terraform state, then apply the declared document (Terraform >= 1.5).
import {
	id = "rds-query-group:rds-query-policy"
	to = aws_iam_group_policy.group_rds-query-group_khnmx_rds-query-policy
}

resource "aws_iam_group_policy" "group_rds-query-group_khnmx_rds-query-policy" {
	name   = "rds-query-policy"
	group   = "rds-query-group"
	policy = jsonencode({
		"Version" = "2012-10-17"
		"Statement" = [
			{
				"Action" = [
					"rds:DescribeDBInstances",
					"rds:DescribeDBClusters",
					"rds:DescribeGlobalClusters",
					"rds:DescribeDBClusterParameterGroups",
					"rds:DescribeDBClusterParameters",
					"rds:DescribeDBParameterGroups",
					"rds:DescribeDBParameters",
					"rds:DescribeEngineDefaultParameters",
					"rds:DescribeEngineDefaultClusterParameters"
				]
				"Effect" = "Allow"
				"Resource" = "*"
			}
		]
	})
}
