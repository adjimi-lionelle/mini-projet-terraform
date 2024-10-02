
variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "tags" {
  type        = map(any)
  description = "Tags to assign to EC2"
  default     = {
    Name = "ec2-lionelle"
  }
}

variable "key_name" {
  description = "Key pair name for SSH access"
  default     = "lionelle"
}


