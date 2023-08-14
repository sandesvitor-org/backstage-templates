# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-s3-bucket.git//.?ref=master"
}

inputs = {
  bucket = "${{ values.bucket_name }}"

  {% if values.block_public -%}
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  {% endif %}

  {%- if values.server_side_encryption %}
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
  {% endif %}

  versioning = {
    enabled = ${{ values.versioning }}
  }
}