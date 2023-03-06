terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.44.2"
    }
  }

  # A backend block cannot refer to named values
  # (like input variables, locals, or data source attributes).
  # backend "s3" {
  #   #Specifies the bucket name where to store the state. Make sure to create it in advance.
  #   bucket = "terraformbackend-xk"
  #   #"Specifies the path to the state file inside the bucket."
  #   key = "terraform.tfstate"
  #   #The access key for backend bucket authentication
  #   access_key = "XXXXX"
  #   #The secret key for backend bucket authentication
  #   secret_key = "XXXXX"
  #   #The region and endpoint of backend bucket
  #   region   = "ap-southeast-3"
  #   endpoint = "https://obs.ap-southeast-3.myhuaweicloud.com"

  #   skip_region_validation      = true
  #   skip_credentials_validation = true
  #   skip_metadata_api_check     = true
  # }
}

provider "huaweicloud" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}