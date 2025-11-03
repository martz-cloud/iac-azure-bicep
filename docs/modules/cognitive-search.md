# Module: Cognitive Search

Creates an Azure Cognitive Search service.

## At a glance
- Service name: <org>-<app>-<env>-search

## Inputs
| Param | Type | Default | Notes |
|---|---|---|---|
| namePrefix | string | (none) | <ORG>-<APP>-<ENV> |
| location | string | (none) | region |
| sku | string | basic | basic or standard |

## Outputs
| Name | Description |
|---|---|
| searchName | Search service name |

## Steps
1) Uncomment this module in main.bicep.  
2) Deploy.

## Validate
```bash
az resource show   -g "<ORG>-<APP>-dev-rg"   --resource-type "Microsoft.Search/searchServices"   -n "<org>-<app>-dev-search" -o table
```

## Troubleshooting
- Network restrictions: extend module for private endpoints or network rules if required
