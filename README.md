# IaC – Azure Bicep Modules

Reusable, parameterized Bicep modules for deploying common Azure building blocks across tenants/environments.
**No environment-specific names are hard-coded.** Use the placeholders below when deploying.

## Naming & placeholders
- `<ORG_NAME>` – your organization short name (e.g., `contoso`)
- `<APP_NAME>` – application/system name (e.g., `platform`)
- `<ENV>` – environment tag (`dev`, `test`, `prod`)
- `<LOCATION>` – Azure region short name (e.g., `eastus2`)

**Example resource prefix:** `${ORG_NAME}-${APP_NAME}-${ENV}` → `org-platform-dev`

## Layout
```
/modules
  keyvault.bicep
  storage.bicep
  loganalytics.bicep
  containerregistry.bicep
  containerapps-env.bicep
  cognitive-search.bicep
  postgres-flex.bicep
/main.bicep
/parameters
  main.parameters.dev.json
  main.parameters.prod.json
/.github/workflows/validate.yml
```

## Quick start
```bash
az login
az account set --subscription "<SUBSCRIPTION_ID>"

# validate
az deployment sub what-if   --location <LOCATION>   --template-file main.bicep   --parameters @parameters/main.parameters.dev.json

# deploy
az deployment sub create   --location <LOCATION>   --template-file main.bicep   --parameters @parameters/main.parameters.dev.json
```

> Adjust scopes (subscription/resource group) as needed. These examples use a subscription-level deployment for flexibility.
