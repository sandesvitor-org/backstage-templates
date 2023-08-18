{% set settings = config.account_settings[parameters.account] %}
provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "{{ settings.role_arn }}"
  }
}
