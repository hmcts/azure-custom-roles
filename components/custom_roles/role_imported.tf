locals {
    imported_role_definitions = yamldecode(file("${path.cwd}/role_definitions.yaml"))
}

import {
    for_each = { for role in local.imported_role_definitions : role.name => role }

    id = each.value.id
    to = azurerm_role_definition.imported_custom_roles[each.key]
}

resource "azurerm_role_definition" "imported_custom_roles" {
    for_each = { for role in local.imported_role_definitions : role.name => role }

    name              = each.key
    description       = each.value.description
    scope             = each.value.scope
    assignable_scopes = each.value.assignableScopes

    permissions {
        actions          = each.value.permissions.actions
        not_actions      = each.value.permissions.not_actions
        data_actions     = each.value.permissions.data_actions
        not_data_actions = each.value.permissions.not_data_actions
    }
}
