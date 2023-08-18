terraform {
  backend "s3" {
    bucket = "my-terraform-bucket"
    key    = "aws/${{ parameters.account }}/global/s3/${{ values.bucket_name }}/terraform.tfstate"
  }
}