#resource "aws_iam_role" "efs_test_role" {
#  name = "efs_test_role"
#
#  assume_role_policy = <<EOF
#{
#    "Version": "2012-10-17",
#    "Statement": [
#        {
#            "Action": [
#                "ec2:CreateNetworkInterface",
#                "ec2:DeleteNetworkInterface",
#                "ec2:DescribeAvailabilityZones",
#                "ec2:DescribeNetworkInterfaceAttribute",
#                "ec2:DescribeNetworkInterfaces",
#                "ec2:DescribeSecurityGroups",
#                "ec2:DescribeSubnets",
#                "ec2:DescribeVpcAttribute",
#                "ec2:DescribeVpcs",
#                "ec2:ModifyNetworkInterfaceAttribute",
#                "elasticfilesystem:*",
#                "kms:DescribeKey",
#                "kms:ListAliases"
#            ],
#            "Effect": "Allow",
#            "Resource": "*"
#        }
#    ]
#}
#EOF
#}

