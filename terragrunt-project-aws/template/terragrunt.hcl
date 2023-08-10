terraform_version_constraint  = "${{ values.terraform_version_constraint }}"
terragrunt_version_constraint = "${{ values.terragrunt_version_constraint }}"

terraform {
  extra_arguments "disable_auto_approve" {
    commands  = ["apply", "destroy", ]
    arguments = ["-auto-approve=false"]
  }
}

locals {
  # Automatically load account-level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Extract commonly used variables for easy access
  aws_region          = local.account_vars.locals.aws_region
  aws_account_profile = local.account_vars.locals.aws_account_profile
  aws_bucket_env      = local.account_vars.locals.aws_bucket_env
  atlantis_workflow   = local.account_vars.locals.atlantis_workflow
}

# ----------------------------------------------------------------------------------------------------------------
# GENERATED REMOTE STATE BLOCK
# ----------------------------------------------------------------------------------------------------------------
# Generate the Terraform remote state block for storing state in S3
remote_state {
  backend = "s3"
  config = {
    encrypt                  = true
    bucket                   = local.aws_bucket_env
    key                      = "${path_relative_to_include()}/terraform.tfstate"
    region                   = local.aws_region
    profile                  = local.aws_bucket_profile
    skip_bucket_root_access  = true
    skip_bucket_enforced_tls = true
  }
  generate = {
    path      = "backend.tf"
    if_exists = "skip"
  }
}

# ----------------------------------------------------------------------------------------------------------------
# GENERATED PROVIDER BLOCK
# ----------------------------------------------------------------------------------------------------------------
generate "provider" {
  path      = "provider.tf"
  if_exists = "skip"
  contents  = <<EOF
provider "aws" {
  region  = "${local.aws_region}"
  profile = "${local.aws_account_profile}"
}
EOF
}

