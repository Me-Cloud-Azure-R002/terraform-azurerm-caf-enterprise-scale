# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}

# {
#   "appId": "3f03851b-75ed-49e4-a130-d078510c099b",
#   "displayName": "sp-at002-app001-contributor",
#   "password": "A178Q~Ydyb2TzrWWLLSnn84XjIzKKZwtecDFqaz9",
#   "tenant": "87c1b7a7-4e0e-4afe-9593-8cbfdcc8eb61"
# }

}
