{% set settings = parameters[parameters.account] %}
{% set role_arn = settings.role_arn %}

provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn = "${role_arn}"
  }
}
