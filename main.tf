data "huaweicloud_availability_zones" "test" {}

module "network_service" {
  source = "./modules/VPC"

  name_prefix = var.network_name_prefix
  vpc_cidr    = var.vpc_cidr
}

module "ecs_service" {
  source = "./modules/ECS"

  instance_count    = var.instance_count
  image_name        = var.image_name
  name_prefix       = var.ecs_name_prefix
  az_names          = data.huaweicloud_availability_zones.test.names
  subnet_id         = module.network_service.subnet_id
  security_group_id = module.network_service.security_group_id
  admin_password    = var.ecs_admin_password
  user_data_path    = "${file("./scripts/user_data.sh")}" 
}


module "eip_service" {
  source = "./modules/EIP"

  name_prefix    = var.eip_name_prefix
  bandwidth_size = var.eip_bandwidth
  charge_mode    = var.eip_charge_mode
}

module "log_tank_service" {
  source      = "./modules/LTS"
  name_prefix = var.lts_name_prefix
}

module "elb_service" {
  source = "./modules/ELB"

  name_prefix   = var.elb_name_prefix
  vpc_id        = module.network_service.vpc_id
  subnet_id     = module.network_service.ipv4_subnet_id
  az_names      = [data.huaweicloud_availability_zones.test.names[0]]
  ecs_ips       = module.ecs_service.ecs_ips
  ecs_subnet    = module.network_service.ipv4_subnet_id
  eip_id        = module.eip_service.eip_id
  lts_group_id  = module.log_tank_service.log_group_id
  lts_stream_id = module.log_tank_service.log_stream_id
}


