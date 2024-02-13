locals {
  azure_firewall_application_rule_collection = { for azure_firewall_application_rule_collection in var.azure_firewall__application_rule_collection_list : azure_firewall_application_rule_collection.name => azure_firewall }
}
