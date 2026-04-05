variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "chat-app-rg"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "Central India"
}

variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "chat-app-aks"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "chatappacr12345"
}