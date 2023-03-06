terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.43.0"
    }
  }
}

resource "huaweicloud_vpc_eip" "myeip" {
  publicip {
    type = "5_bgp"
  }

  bandwidth {
    share_type  = "PER"
    name        = format("%s-eip", var.name_prefix)
    size        = var.bandwidth_size
    charge_mode = var.charge_mode
  }
}