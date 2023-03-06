output "ecs_ips" {
  value = huaweicloud_compute_instance.test.*.access_ip_v4
}

