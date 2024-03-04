resource "random_string" "this" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

output "ramdom" {
  value = random_string.this.result
}

output "Hello" {
  value = "hello-4"
}
