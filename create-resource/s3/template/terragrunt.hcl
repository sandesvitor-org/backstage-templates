# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:dlpco/terraform-modules.git//aws-s3-bucket?ref=aws-s3-bucket-0.2.0"
}

inputs = {
  bucket                  = "${{ values.resourceName }}"
  random_suffix_separator = "."

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  versioning = {
    enabled = false
  }
}
