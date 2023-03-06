variable "instance_count" {
  description = "The number of ECS instances you want to create"
}

variable "image_name" {
  description = "The name of IMS image within HUAWEI Cloud"
}

variable "az_names" {
  description = "The name list of availability zone the Huaweicloud VPC"
}

variable "name_prefix" {
  description = "The name prefix for ECS resources within HUAWEI Cloud"
}

variable "admin_password" {
  description = "The password of ECS instance administrator within HUAWEI Cloud"
}

variable "security_group_id" {
  description = "The security group ID for the VPC service within HUAWEI Cloud"
}

variable "subnet_id" {
  description = "The network ID of subnet resource within HUAWEI Cloud"
}

variable "user_data_path" {
  description = "the path of the user data"

}