include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../modules/proxmox"

  extra_arguments "auto_tfvars" {
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      "${get_parent_terragrunt_dir()}/modules/auto.tfvars",
      "${get_parent_terragrunt_dir()}/modules/proxmox/auto.tfvars"
    ]
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
# Primary node (kitty)
provider "proxmox" {
  endpoint  = local.proxmox_primary_node_api_url
  api_token = var.proxmox_primary_node_api_token
  # Proxmox uses a self-signed certificate by default.
  insecure  = true
}

EOF
}

inputs = {
  # Inputs will be picked up from *.tfvars or env vars
}
