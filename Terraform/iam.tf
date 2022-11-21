resource "aws_iam_role" "iam_role" {
  name = "${local.resource_component}-role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
                },
            "Effect": "Allow",
            "Sid": ""
        }
        ]
    })
}

resource "aws_iam_role_policy" "iam_policy" {
  name = "${local.resource_component}-policy"
  role = "${aws_iam_role.iam_role.id}"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:GetObject"
                ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::${var.source_bucket}/*"
        },
        {
            "Action": [
                "s3:PutObject"
                ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::${var.destination_bucket}/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "sqs:GetQueueAttributes",
                "sqs:ReceiveMessage",
                "sqs:DeleteMessage"
                ],
            "Resource": "arn:aws:sqs:ap-southeast-1:669201380121:${var.job_queue}"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents"
                ],
            "Resource": "arn:aws:logs:*:*:*"
        }
    ]
    })
}

# s3 bucket policy
resource "aws_s3_bucket_policy" "source_bucket_policy" {
  bucket = aws_s3_bucket.source_bucket.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "*",
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "*"
                ]
            },
            "Action": [
                "s3:*"
            ],
            "Resource": "arn:aws:s3:::${var.source_bucket}/*"
        }
    ]
    })
    
}

# attach on component end