resource "aws_sqs_queue" "sqs_queue" {
    name                      = "${var.job_queue}"
    message_retention_seconds = 60 * 60 * 24
    receive_wait_time_seconds = 5
    visibility_timeout_seconds = 60 * 2
    # flight -

    policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": "*",
                "Action": "sqs:SendMessage",
                "Resource": "arn:aws:sqs:${var.aws_region}:669201380121:${var.job_queue}",
                "Condition": {
                    "ArnEquals":{ 
                        "aws:SourceArn": "${aws_s3_bucket.source_bucket.arn}" 
                    }
                }
            }
        ]
        }
    )
}