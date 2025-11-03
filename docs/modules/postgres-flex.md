# Module: PostgreSQL Flexible Server

Creates a PostgreSQL Flexible Server.

## At a glance
- Server name: <org>-<app>-<env>-pg
- Replace admin placeholders with secure parameters or Key Vault references

## Inputs
| Param | Type | Default | Notes |
|---|---|---|---|
| namePrefix | string | (none) | <ORG>-<APP>-<ENV> |
| location | string | (none) | region |
| version | string | 16 | major version |
| skuName | string | Standard_B1ms | size |
| storageSizeGB | int | 64 | storage size |

## Outputs
| Name | Description |
|---|---|
| serverName | PostgreSQL server name |

## Steps
1) Uncomment this module in main.bicep.  
2) Pass admin credentials as secure parameters at deploy time.  
3) Deploy.

## Validate
```bash
az resource show   -g "<ORG>-<APP>-dev-rg"   --resource-type "Microsoft.DBforPostgreSQL/flexibleServers"   -n "<org>-<app>-dev-pg" -o table
```

## Troubleshooting
- Credentials: do not store in files; use secure parameters or Key Vault
- Connectivity: add firewall rules or private networking as needed
