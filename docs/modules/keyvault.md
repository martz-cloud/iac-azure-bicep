# Module: Key Vault

Creates a Key Vault with soft delete and purge protection defaults.

## At a glance
- Vault name: <org>-<app>-<env>-kv
- Access model: RBAC (no access policies by default)

## Inputs
| Param | Type | Default | Notes |
|---|---|---|---|
| namePrefix | string | (none) | <ORG_NAME>-<APP_NAME>-<ENV> |
| location | string | (none) | Azure region |
| skuName | string | standard | standard or premium |
| purgeProtectionEnabled | bool | true | recommended true |
| softDeleteRetentionDays | int | 7 | range 7 to 90 |

## Outputs
| Name | Description |
|---|---|
| (none) | Reference the vault by deterministic name |

## Steps
1) Keep the module referenced in main.bicep.  
2) Run what-if and deploy using the Quickstart.

## Validate
```bash
az keyvault show -g "<ORG>-<APP>-dev-rg" -n "<org>-<app>-dev-kv" -o table
```

## Troubleshooting
- 403 on secret operations: confirm RBAC role at vault scope
- Purge protection cannot be disabled after enforcement by policy
