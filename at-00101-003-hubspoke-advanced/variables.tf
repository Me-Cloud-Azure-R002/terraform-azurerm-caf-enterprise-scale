# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "at-mgmt-grp-0011"
}

variable "root_parent_id" {
  type    = string
  default = "at-prac-terra-basic-0001"
}

variable "root_name" {
  type    = string
  default = "AT Terra Practice 0011"
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
    demo_type = "deploy_connectivity_resources_custom"
  }
}