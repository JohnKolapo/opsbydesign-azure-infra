variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "tags" { type = map(string) }

variable "records" {
  description = "Map of DNS records"
  type = map(object({
    type    = string
    ttl     = number
    records = list(string)
  }))
}
