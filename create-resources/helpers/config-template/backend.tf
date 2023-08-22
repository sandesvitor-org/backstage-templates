terraform {
  backend "s3" {
    bucket                   = "bucket_name"
    encrypt                  = true
    region                   = "us-east-1"
    key                      = "aws/${{ values.account }}/global/s3/${{ values.bucket_name }}/terraform.tfstate"
    role_arn                 = "${{ values.role_arn }}"
    skip_bucket_root_access  = true
    skip_bucket_enforced_tls = true
  }
}
