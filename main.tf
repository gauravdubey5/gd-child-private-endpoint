resource "azurerm_private_endpoint" "private_endpoints" {
  for_each                      = var.private_endpoints
  name                          = each.value.name
  location                      = each.value.location
  resource_group_name           = each.value.resource_group_name
  subnet_id                     = lookup(each.value, "subnet_id", null) != null ? each.value.subnet_id : data.azurerm_subnet.subnets[each.key].id
  custom_network_interface_name = lookup(each.value, "custom_network_interface_name", null)

  private_service_connection {
    name                           = lookup(each.value, "private_service_connection_name", "${each.value.name}-psc")
    private_connection_resource_id = each.value.private_connection_resource_id
    is_manual_connection           = lookup(each.value, "is_manual_connection", false)
    subresource_names              = lookup(each.value, "subresource_names", null)
    request_message                = lookup(each.value, "is_manual_connection", false) ? lookup(each.value, "request_message", "Private endpoint access request") : null
  }

  dynamic "private_dns_zone_group" {
    for_each = length(lookup(each.value, "private_dns_zone_ids", [])) > 0 ? [1] : []
    content {
      name                 = lookup(each.value, "private_dns_zone_group_name", "default")
      private_dns_zone_ids = each.value.private_dns_zone_ids
    }
  }

  tags = lookup(each.value, "tags", {})
}
