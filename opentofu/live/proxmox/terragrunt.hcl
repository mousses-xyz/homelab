include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/proxmox"

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
provider "proxmox" {
  endpoint = local.proxmox_primary_node_api_url
  api_token = var.proxmox_primary_node_api_token
  insecure = true
}

# Secondary provider if needed, or handle within module logic
# provider "proxmox" {
#   alias = "secondary"
#   endpoint = local.proxmox_secondary_node_api_url
#   api_token = var.proxmox_secondary_node_api_token
#   insecure = true
# }
EOF
}

inputs = {
  # Inputs will be picked up from *.tfvars or env vars
}
