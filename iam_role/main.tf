
resource "aws_iam_role" "role" {
  name               = var.iam_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = var.tags

}
resource "aws_iam_role_policy" "lambda_policy" {
  name   = "Lambda_policy"
  role   = aws_iam_role.role.id
  policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "logs:*",
          "Effect": "Allow",
          "Resource": "*"
        },
        {
          "Action": "logs:*",
          "Effect": "Allow",
          "Resource": "*"
        },
        {
          "Action": [
            "ec2:Start*",
            "ec2:Stop*",
            "ec2:Describe*",
            "SES:SendEmail",
            "SES:SendRawEmail",
            "ec2:CreateTags",
            "ec2:DeleteTags",
            "rds:DescribeDBInstances",
            "rds:StopDBInstance",
            "rds:StartDBInstance",
            "rds:CreateTags",
            "rds:DeleteTags",
            "rds:ListTagsForResource",
            "rds:AddTagsToResource",
            "rds:RemoveTagsFromResource"



          ],
          "Effect": "Allow",
          "Resource": "*"
        }

      ]
    }
EOF

}

