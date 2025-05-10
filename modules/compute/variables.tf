variable "name" {
  description = "Base name for the VM and related resources"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for all compute resources"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "ID of the subnet where the NIC will be created"
  type        = string
}

variable "user_assigned_identity_id" {
  description = "ID of the user-assigned managed identity to attach"
  type        = string
}

variable "public_ip" {
  description = "Whether to assign a public IP"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}
