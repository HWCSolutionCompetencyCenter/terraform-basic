terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.43.0"
    }
  }
}

resource "huaweicloud_lts_group" "log_group_test" {
  group_name  = format("%s-log-group", var.name_prefix)
  ttl_in_days = 10
}

resource "huaweicloud_lts_stream" "test_stream" {
  group_id    = huaweicloud_lts_group.log_group_test.id
  stream_name = format("%s-log-stream", var.name_prefix)
}