resource "aws_sqs_queue" "sqs_queue" {
    name                      = var.job_queue
    message_retention_seconds = 60 * 60 * 24
    receive_wait_time_seconds = 5
    visibility_timeout_seconds = 60 * 2
    # redrive_policy = jsonencode({
    # deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
    # maxReceiveCount     = 4
    # })
}