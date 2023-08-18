provider "aws" {
  region = "us-east-1"
  {% set settings = parameters[parameters.account] %}
  assume_role {
    role_arn = "${settings.role_arn}"
  }
}