{% set roleArn = steps.aws-config.output.result.account_settings[parameters.account].role_arn %}
provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn = "{{ roleArn }}"
  }
}

# provider "aws" {
#   region = "us-east-1"

#   assume_role {
#     role_arn = "${{ values.role_arn }}"
#   }
# }
