terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.43.0"
    }
  }
}

data "huaweicloud_elb_flavors" "flavors" {
  type            = "L7"
  max_connections = 200000
  cps             = 2000
  bandwidth       = 50
}

resource "huaweicloud_elb_loadbalancer" "test_lb" {
  name              = format("%s-loadbalancer", var.name_prefix)
  vpc_id            = var.vpc_id
  ipv4_subnet_id    = var.subnet_id
  availability_zone = var.az_names
  l7_flavor_id      = data.huaweicloud_elb_flavors.flavors.ids[0]
  ipv4_eip_id       = var.eip_id
}

resource "huaweicloud_elb_listener" "test_listener" {
  name            = format("%s-listener", var.name_prefix)
  protocol        = "HTTP"
  protocol_port   = 8080
  loadbalancer_id = huaweicloud_elb_loadbalancer.test_lb.id

  idle_timeout     = 60
  request_timeout  = 60
  response_timeout = 60
}

resource "huaweicloud_elb_pool" "test_pool" {
  name        = format("%s-pool", var.name_prefix)
  protocol    = "HTTP"
  lb_method   = "ROUND_ROBIN"
  listener_id = huaweicloud_elb_listener.test_listener.id
}

resource "huaweicloud_elb_monitor" "test_elb_monitor" {
  protocol    = "HTTP"
  interval    = 20
  timeout     = 15
  max_retries = 10
  url_path    = "/"
  pool_id     = huaweicloud_elb_pool.test_pool.id
}

resource "huaweicloud_elb_member" "test_compute_instances" {
  count         = length(var.ecs_ips)
  address       = var.ecs_ips[count.index]
  protocol_port = 8080
  pool_id       = huaweicloud_elb_pool.test_pool.id
  subnet_id     = var.ecs_subnet
}

resource "huaweicloud_elb_logtank" "elb_lts_test" {
  loadbalancer_id = huaweicloud_elb_loadbalancer.test_lb.id
  log_group_id    = var.lts_group_id
  log_topic_id    = var.lts_stream_id
}