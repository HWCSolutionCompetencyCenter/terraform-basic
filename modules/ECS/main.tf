terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.43.0"
    }
  }
}

data "huaweicloud_images_image" "test" {
  name        = var.image_name
  most_recent = true
}

data "huaweicloud_compute_flavors" "test" {
  availability_zone = var.az_names[0]

  performance_type = "normal"
  cpu_core_count   = 2
  memory_size      = 4
}

resource "huaweicloud_compute_instance" "test" {
  count     = var.instance_count
  image_id  = data.huaweicloud_images_image.test.id
  flavor_id = data.huaweicloud_compute_flavors.test.ids[0]

  name              = format("%s-instance-${count.index + 1}", var.name_prefix)
  admin_pass        = var.admin_password
  availability_zone = var.az_names[0]

  security_group_ids = [
    var.security_group_id,
  ]

  system_disk_type = "SSD"
  system_disk_size = 40

  data_disks {
    type = "SSD"
    size = 40
  }

  network {
    uuid = var.subnet_id
  }
  #If the user_data field is specified for a Linux ECS that is created using an image
  # with Cloud-Init installed, the admin_pass field becomes invalid.
  user_data = var.user_data_path
}



