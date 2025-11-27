include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/cloudflare"

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
      "-var-file=${get_terragrunt_dir()}/common.auto.tfvars",
      "-var-file=${get_terragrunt_dir()}/auto.tfvars"
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
