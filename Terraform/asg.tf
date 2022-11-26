resource "aws_autoscaling_group" "asg" {
  name                          = "test-min-asg" 
  availability_zones            = ["${var.aws_region}a", "${var.aws_region}b"]
  desired_capacity              = 0
  max_size                      = 3
  min_size                      = 0
  
  launch_template {
    id                          = "${aws_launch_template.machine_template.id}"
    version                     = "$Latest"
    # '$Latest', '$Default', numeric
  }
}

resource "aws_autoscaling_policy" "asg_policy_scale_up" {
  name                          = "asg_step_up_policy"
  autoscaling_group_name        = "${aws_autoscaling_group.asg.name}"
  adjustment_type               = "ChangeInCapacity"
  policy_type                   = "StepScaling"
  estimated_instance_warmup     = 300

  step_adjustment {
    scaling_adjustment          = 1
    metric_interval_lower_bound = 0
  }
}

resource "aws_autoscaling_policy" "asg_policy_scale_down" {
  name                          = "asg_step_down_policy"
  autoscaling_group_name        = "${aws_autoscaling_group.asg.name}"
  adjustment_type               = "ChangeInCapacity"
  policy_type                   = "StepScaling"
  estimated_instance_warmup     = 300

  step_adjustment {
    scaling_adjustment          = -1
    metric_interval_lower_bound = 0
    # metric_interval_upper_bound = 1
  }
}
