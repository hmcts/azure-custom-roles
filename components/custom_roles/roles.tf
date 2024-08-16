locals {
  role_definitions_yaml = file("${path.cwd}/role_definitions.yaml")
  role_definitions      = yamldecode(local.role_definitions_yaml)
}

resource "azurerm_role_definition" "custom_roles" {
  for_each = { for role in local.role_definitions : role.name => role }

  name        = each.value.name
  description = each.value.description
  scope       = each.value.scope
  permissions {
    actions          = each.value.permissions.actions
    not_actions      = each.value.permissions.not_actions
    data_actions     = each.value.permissions.data_actions
    not_data_actions = each.value.permissions.not_data_actions
  }
}