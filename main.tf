# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "e5c53a81-f5c9-4864-b65a-d6fc347b4e2d"
  tenant_id       = "1f4beacd-b7aa-49b2-aaa1-b8525cb257e0"
  client_id        = "d5bb4456-d234-47a4-8628-7506c6f58862"
  client_secret =   "mh8a26jmG0T~-p_c7iG~T-~owDUPI7tYWF"
}

# creating Resouce group
resource "azurerm_resource_group" "tf_test"{
    name = "tfmailrsg"
    location = "West Europe"

}

resource "azurerm_container_group" "tfcg_test"{
    name = "weatherapi"
    location = azurerm_resource_group.tf_test.location
    resource_group_name = azurerm_resource_group.tf_test.name

    ip_address_type = "public"
    dns_name_label = "rnagellidnsname"
    os_type = "Linux"

    container {
      name = "weatherapi"
      image = "rnagelli/weatherapi:latest"
      cpu = 1
      memory = 1

      ports{
           port = 8080
           protocol = "TCP"
       }


    }


    }