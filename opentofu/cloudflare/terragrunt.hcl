include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../modules/cloudflare"

  extra_arguments "custom_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh",
      "destroy"
    ]

    arguments = [
      "-var-file=${get_terragrunt_dir()}/../modules/auto.tfvars",
      "-var-file=${get_terragrunt_dir()}/../modules/cloudflare/auto.tfvars"
    ]
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
EOF
}

inputs = {
  # Inputs will be picked up from *.tfvars or env vars
}
