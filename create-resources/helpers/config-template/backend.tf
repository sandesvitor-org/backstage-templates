terraform {
  backend "s3" {
    bucket   = "${{ values.aws_state_bucket_name }}"
    encrypt  = true
    region   = "${{ values.aws_state_bucket_region }}"
    key      = "${{ values.aws_state_bucket_key }}"
    {% if values.aws_state_bucket_role_arn -%}
    role_arn = "${{ values.aws_state_bucket_role_arn }}"
    {%- endif %}
  }
}
