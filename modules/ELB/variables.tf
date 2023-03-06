variable "name_prefix" {
  description = "The common name prefix for ELB resources within HUAWEI Cloud"
}

variable "vpc_id" {
  description = "The vpc on which to create the loadbalancer. Changing this creates a new loadbalancer."
}

variable "subnet_id" {
  description = "The IPv4 subnet ID of the subnet on which to allocate the loadbalancer's ipv4 address."
}

variable "az_names" {
  description = "AZs the ELB instance will be. If you need high availability, choose multiple AZs"
}

variable "eip_id" {
  description = "The EIP ID."
}


variable "ecs_ips" {
  description = "The IP address of the member/ECS to receive traffic from the load balancer. "
}

variable "ecs_subnet" {
  description = "The IPv4 or IPv6 subnet ID of the subnet in which to access the member."
}


variable "lts_group_id" {

}

variable "lts_stream_id" {

}