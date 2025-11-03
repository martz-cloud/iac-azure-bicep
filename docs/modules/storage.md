# Module: Storage

Creates a Storage account with HTTPS only and TLS 1.2+.

## At a glance
- Account name is derived from the prefix and must be globally unique

## Inputs
| Param | Type | Default | Notes |
|---|---|---|---|
| namePrefix | string | (none) | collapsed for account name |
| location | string | (none) | region |
| kind | string | StorageV2 |  |
| enableHttpsTrafficOnly | bool | true | blocks HTTP |

## Outputs
| Name | Description |
|---|---|
| storageAccountName | Name of the created account |

## Steps
1) Keep the module referenced in main.bicep.  
2) Run what-if and deploy.

## Validate
```bash
az storage account list -g "<ORG>-<APP>-dev-rg" -o table
```

## Troubleshooting
- Name not available: adjust prefix components to find a unique name
- Public access concerns: add network rules or private endpoints in an extended module
