# locals {
#   provision_config= <<-END
#     #cloud-config
#     ${jsonencode({
#       write_files = [
#         {
#           path        = "/home/ubuntu/project/src/main.py"
#           permissions = "0644"
#           encoding    = "b64"
#           content     = filebase64("../src/main.py")
#         },
#       ]
#     })}
#   END
# }

# data "cloudinit_config" "config" {
#   gzip          = false
#   base64_encode = true

#   part {
#     content_type = "text/cloud-config"
#     filename     = "cloud-config_provision.yaml"
#     content      = local.provision_config
#     }

#   part {
#     content_type = "text/x-shellscript"
#     filename     = "setup_dependencies.sh"
#     # content      = filebase64("./setup.sh")
#     content  = <<-EOF
#       #!/bin/bash
#       cd /root
#       apt update && sudo apt upgrade -y
#       echo "done"
#       apt-get install ffmpeg -y
#       apt  install awscli -y

#       apt install python3-pip -y
#       pip3 install boto3

#       wget https://github.com/shaka-project/shaka-packager/releases/download/v2.6.1/packager-linux-x64  -O ../bin/packager
#       chmod +x ../bin/packager

#       echo "for faster/visual confirmation of above execution.."
#       wget https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4 -O I_RAN.mp4

#       cd /home/ubuntu/project/src
#       python3 main.py
#     EOF
#   }
# }

resource "aws_iam_instance_profile" "instance_profile" {
  name                  = "${local.resource_component}-profile"
  role                  = "${aws_iam_role.ec2_role.name}"
}

resource "aws_launch_template" "machine_template" {
  name                  = "test-min-template" 
  image_id              = "${var.instance_ami}"
  instance_type         = "${var.instance_type}"
  key_name              = "${var.ssh_key}"
  user_data             = filebase64("./setup2.sh")
  # user_data             = data.cloudinit_config.config.rendered

  iam_instance_profile {
    name                = "${aws_iam_instance_profile.instance_profile.name}"
  }

  tag_specifications {
    resource_type       = "instance"
    tags = {
      Name              = local.resource_component
      Source            = "Autoscaling"
    } 
  }

  monitoring {
    enabled             = true
  }

}
