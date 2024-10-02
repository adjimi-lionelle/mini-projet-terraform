
variable "ebs_size" {
  type        = number
  description = "Size of the EBS volume in GB"
  default     = 8
}

variable "instance_id" {
  description = "The ID of the EC2 instance"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the EBS volume"
  type        = string
}
