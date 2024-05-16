

locals {
  providers = try(yamldecode(file("${get_original_terragrunt_dir()}/providers.yaml")), [])
}

generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {

  required_providers {
    %{if contains(local.providers, "github")}
      github = {
        source  = "integrations/github"
        version = "~> 6.0"
    }
    %{endif}
  }
}
EOF
}
