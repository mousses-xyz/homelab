include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../modules/cloudflare"

  extra_arguments "auto_tfvars" {
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      "${get_parent_terragrunt_dir()}/modules/auto.tfvars",
      "${get_parent_terragrunt_dir()}/modules/cloudflare/auto.tfvars"
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
