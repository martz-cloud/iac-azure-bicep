# Module: Container Apps Environment

Creates a Container Apps managed environment wired to Log Analytics.

## At a glance
- Environment name: <org>-<app>-<env>-cae
- Requires Log Analytics outputs

## Inputs
| Param | Type | Default | Notes |
|---|---|---|---|
| namePrefix | string | (none) | <ORG>-<APP>-<ENV> |
| location | string | (none) | region |
| logAnalyticsWorkspaceId | string | (none) | from loganalytics module |
| logAnalyticsPrimaryKey | string | (none) | from loganalytics module |

## Outputs
| Name | Description |
|---|---|
| environmentId | Resource ID of the environment |

## Steps
1) Ensure Log Analytics runs first in main.bicep.  
2) Deploy.

## Validate
```bash
az resource show   -g "<ORG>-<APP>-dev-rg"   --resource-type "Microsoft.App/managedEnvironments"   -n "<org>-<app>-dev-cae" -o table
```

## Troubleshooting
- Log config errors: confirm both workspaceId and primarySharedKey are passed
