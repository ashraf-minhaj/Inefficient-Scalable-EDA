resource "aws_autoscaling_group" "asg" {
  availability_zones  = ["${var.aws_region}a", "${var.aws_region}b"]
  desired_capacity    = 0
  max_size            = 3
  min_size            = 0

  launch_template {
    id                = "${aws_launch_template.machine_template.id}"
    version           = "$Latest"
    # '$Latest', '$Default', numeric
  }
}