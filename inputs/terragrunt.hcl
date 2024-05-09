remote_state {
  backend = "s3"
  config = {
    endpoint                           = "https://frzjkivjixyp.compat.objectstorage.eu-frankfurt-1.oraclecloud.com"
    region                             = "eu-frankfurt-1"
    bucket                             = "terraform-states"
    key                                = "iac/inputs/${path_relative_to_include()}/terraform.tfstate"
    shared_credentials_file            = "/Users/marcosanavia/Git/.creds/terraform-states_bucket_credentials"
    skip_region_validation             = true
    skip_credentials_validation        = true
    skip_requesting_account_id         = true
    skip_metadata_api_check            = true
    force_path_style                   = true
    skip_bucket_ssencryption           = true
    skip_bucket_root_access            = true
    skip_bucket_enforced_tls           = true
    skip_bucket_public_access_blocking = true
    disable_bucket_update              = true
  }
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {}
}
EOF
}
