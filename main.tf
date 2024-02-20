#--------- firewall application rule collection ------------
resource "azurerm_firewall_application_rule_collection" "azure_firewall_application_rule_collection" {
  for_each            = local.azure_firewall_application_rule_collection
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  azure_firewall_name = each.value.azure_firewall_name
  priority            = each.value.priority
  action              = each.value.action //== "Allow" ? "Allow" : "Deny"

  dynamic "rule" {
    for_each = each.value.rule_list
    content {
      name             = rule.value.name
      source_addresses = rule.value.source_addresses
      target_fqdns     = rule.value.target_fqdns

      dynamic "protocol" {
        for_each = rule.value.protocol_list
        content {
          port = protocol.value.port
          type = protocol.value.type

        }
      }
    }
  }
}

