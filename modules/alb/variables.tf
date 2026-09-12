variable "project_name" {
  type = string
}

variable "alb_name" {
  type = string
}

variable "target_group_name" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_security_group" {
  type = string
}

variable "application_port" {
  type = number
}

variable "app_instance_ids" {
  type = list(string
}

variable "vpc_id" {
  type = string
}