provider "aws" {
  region  = ${{ values.aws_provider_region }}
  {% if values.aws_provider_role_arn -%}
  assume_role {
    role_arn = ${{ values.aws_provider_role_arn }}
  }
  {% endif -%}
  {% if values.aws_provider_profile -%}
  profile = ${{ values.aws_provider_profile }}
  {%- endif %}
}
