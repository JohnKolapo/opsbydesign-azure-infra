variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "sku_name" { type = string }
variable "tenant_id" { type = string }
variable "access_policies" {
  type = list(object({
    tenant_id   = string
    object_id   = string
    permissions = map(list(string))
  }))
}
variable "tags" { type = map(string) }
