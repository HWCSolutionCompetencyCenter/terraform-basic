output "vpc_id" {
  description = "The vpc ID of within HUAWEI Cloud"
  value       = huaweicloud_vpc.test.id
}

output "subnet_id" {
  description = "The UUID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.test.id
}

output "ipv4_subnet_id" {
  description = "The network ID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.test.ipv4_subnet_id
}

output "security_group_id" {
  description = "The network ID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_networking_secgroup.test.id
}