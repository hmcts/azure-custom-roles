# Azure Custom Roles

Repository used for the creation of Custom RBAC Roles in Azure Access Policies (IAM)

## Usage

All Custom Roles will be created at the HMCTS Managaement Group level and so are assignable at all child management groups, subscriptions & individual resources.

To create a new role, edit the ./components/custom_roles/role_definitions.yaml file

````
- name: <Name of the role. Must be unique in the tenant>
  description: <description of the role>
  permissions:
    actions:
      - <actions permission 1>
      - <actions permission 2>
    not_actions:
      - <not_actions permssions 1>
      - <not_actions permission 1>
    data_actions:
    not_data_actions:
````

Microsoft provide a guide to determine your permissions [here](https://learn.microsoft.com/en-us/azure/role-based-access-control/custom-roles#how-to-determine-the-permissions-you-need)