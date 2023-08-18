provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = local.account_role_arn
  }
}