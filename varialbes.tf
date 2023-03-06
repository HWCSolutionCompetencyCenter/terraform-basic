################################################################
###  Authentication
variable "region" {
  description = "The region name"
}

variable "access_key" {
  description = "The access key for authentication"
}

variable "secret_key" {
  description = "The secret key for authentication"
}

################################################################
###  Network
variable "network_name_prefix" {
  description = "The name prefix for all VPC resources within HUAWEI Cloud"
}

variable "vpc_cidr" {
  description = "The CIDR of the VPC resource within HUAWEI Cloud"
  default     = "172.16.0.0/16"
}
################################################################
###  ECS

variable "instance_count" {
  description = "The number of ECS instances you want to create"
  default     = 1
}

variable "image_name" {
  description = "The name of IMS image within HUAWEI Cloud"
  default     = "Ubuntu 18.04 server 64bit"
}

variable "ecs_name_prefix" {
  description = "The name prefix for all ECS resources within HUAWEI Cloud"
}

variable "ecs_admin_password" {
  description = "The password of ECS instance administrator within HUAWEI Cloud"
}

################################################################
###  EIP
variable "eip_name_prefix" {
  description = "The name prefix for EIP"
}

variable "eip_bandwidth" {
  description = "The EIP bandwidth"
  default     = 5
}

variable "eip_charge_mode" {
  description = "The charge mode of EIP resources:by traffic or by bandwidth"
  default     = "traffic"
}

################################################################
###  LTS
variable "lts_name_prefix" {
  description = "The name prefix for LTS resources within HUAWEI Cloud"
}

################################################################
###  ELB
variable "elb_name_prefix" {
  description = "The name prefix for ELB resources within HUAWEI Cloud"
}