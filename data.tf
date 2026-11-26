data "azurerm_subnet" "subnets" {
  for_each             = { for k, v in var.private_endpoints : k => v if lookup(v, "subnet_id", null) == null && lookup(v, "subnet_name", null) != null }
  name                 = each.value.subnet_name
  resource_group_name  = lookup(each.value, "subnet_resource_group_name", each.value.resource_group_name)
  virtual_network_name = each.value.virtual_network_name
}
