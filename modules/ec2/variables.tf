variable "project_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair_name" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "app_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}

variable "application_port" {
  type = number
}

variable "web_server" {
  type = string
}