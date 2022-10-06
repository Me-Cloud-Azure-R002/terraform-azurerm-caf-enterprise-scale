# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "at-org-002"
}

variable "root_parent_id" {
  type    = string
  default = "87c1b7a7-4e0e-4afe-dad-8cbfdcc80000"
}

variable "root_name" {
  type    = string
  default = "AT Organization 001"
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

variable "connectivity_resources_location" {
  type    = string
  default = "eastus"
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "at_deploy_connectivity_resources_custom"
  }
}