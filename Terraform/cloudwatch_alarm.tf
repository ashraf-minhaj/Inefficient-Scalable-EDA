resource "aws_cloudwatch_metric_alarm" "cloudwatch_queue_alarm" {
    alarm_name             = "test-queue-alarm"
    namespace              = "AWS/SQS"
    comparison_operator    = "GreaterThanOrEqualToThreshold"
    metric_name            = "ApproximateNumberOfMessagesVisible"
    statistic              = "Sum"
    threshold              = "2"
    period                 = "60"

    evaluation_periods     = "1"
    # treat_missing_data     = "notBreaching"

    dimensions = {
    QueueName              = "${aws_sqs_queue.sqs_queue.name}"
    # AutoScalingGroupName   = "${aws_autoscaling_group.myapp.name}"
    }

    # alarm_description = "This metric monitors queue depth and scales up or down accordingly."
    # alarm_actions     = ["${aws_autoscaling_policy.myapp-scaleup-policy.arn}", "${aws_sns_topic.myqueue_depth_alert_topic.arn}"]
    # ok_actions        = ["${aws_autoscaling_policy.myapp-scaledown-policy.arn}"]
}