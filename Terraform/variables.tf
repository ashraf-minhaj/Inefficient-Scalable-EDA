variable "aws_region" {

}

variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

# variable "aws_profile" {
  
# }

variable "source_bucket" {
  
}

variable "destination_bucket" {
  
}

variable "job_queue" {
  
}

variable "component_prefix" {
  default = "test"
}

variable "component_name" {
  default = "transcoder"
}

variable "instance_ami" {
  default = "ami-0b24d144bd8810792"
  # default = "ami-07651f0c4c315a529"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ssh_key" {
  default = "mars-mariner-transcoder-key"
}

variable "security_groups" {
  default = "launch-wizard-18"
}
