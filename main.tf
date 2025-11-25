
module "resource1" {
  source               = "./modules/Resource1"
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = "storageacctresource1"
}


module "resource2" {
  source               = "./modules/Resource2"
  resource_group_name  = var.resource_group_name
  location             = var.location
  vnet_name            = "vnet-resource2"
  subnet_name          = "default-subnet"
}
