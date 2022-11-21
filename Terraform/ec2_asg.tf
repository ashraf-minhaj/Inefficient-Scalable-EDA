resource "aws_autoscaling_group" "asg" {
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = "${aws_launch_template.machine_template.id}"
    # '$Latest', '$Default', numeric
    version = "$Latest"
  }
}