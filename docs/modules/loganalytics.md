# Module: Log Analytics

Creates a Log Analytics workspace for app and platform logs.

## At a glance
- Workspace name: <org>-<app>-<env>-law
- Used by Container Apps environment for logs

## Inputs
| Param | Type | Default | Notes |
|---|---|---|---|
| namePrefix | string | (none) | <ORG>-<APP>-<ENV> |
| location | string | (none) | region |
| retentionDays | int | 30 | range 7 to 730 |

## Outputs
| Name | Description |
|---|---|
| workspaceId | Resource ID of the workspace |
| primarySharedKey | Shared key for log ingestion |

## Steps
1) Ensure this module runs before Container Apps environment.  
2) Deploy.

## Validate
```bash
az monitor log-analytics workspace show   -g "<ORG>-<APP>-dev-rg" -n "<org>-<app>-dev-law" -o table
```

## Troubleshooting
- Missing outputs downstream: confirm workspaceId and primarySharedKey are passed correctly
