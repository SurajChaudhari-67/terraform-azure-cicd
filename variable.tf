variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
  default     = "rg-terraform-cicd"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}