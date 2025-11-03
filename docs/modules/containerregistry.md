# Module: Container Registry

Creates an Azure Container Registry.

## At a glance
- Registry name is derived from the prefix and must be globally unique

## Inputs
| Param | Type | Default | Notes |
|---|---|---|---|
| namePrefix | string | (none) | collapsed for ACR name |
| location | string | (none) | region |
| sku | string | Basic | Basic, Standard, Premium |
| adminUserEnabled | bool | false | recommend false unless required |

## Outputs
| Name | Description |
|---|---|
| loginServer | ACR login server FQDN |

## Steps
1) Keep the module referenced in main.bicep.  
2) Deploy.

## Validate
```bash
az acr list -g "<ORG>-<APP>-dev-rg" -o table
```

## Troubleshooting
- Admin user disabled: use az acr login with Azure identity or enable only if required
- Name not available: adjust prefix until unique
