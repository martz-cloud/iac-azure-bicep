# IaC - Azure Bicep Modules

Reusable Bicep modules to deploy common Azure building blocks with a consistent prefix.

## At a glance
- Scope: subscription or resource group deployments
- Prefix: <ORG_NAME>-<APP_NAME>-<ENV> (lowercase)
- Example region: eastus2
- Example envs: dev, test, prod

## What this repo contains
- Parameter-driven Bicep modules for core services
- A quickstart to preview and deploy
- CI to validate Bicep builds on each change

## Modules
- [Key Vault](modules/keyvault.md)
- [Storage](modules/storage.md)
- [Log Analytics](modules/loganalytics.md)
- [Container Registry](modules/containerregistry.md)
- [Container Apps Environment](modules/containerapps-env.md)
- [Cognitive Search](modules/cognitive-search.md)
- [PostgreSQL Flexible Server](modules/postgres-flex.md)

## Folder layout
/modules # individual Bicep modules
/parameters # example parameter files
/docs # this documentation site
/.github # CI workflows (validation, docs)
main.bicep # composition that wires modules together

markdown
Copy code

## Quick start
- Read the [Quickstart](quickstart.md) for setup, what-if, and deploy commands
- Validate changes with `az deployment ... what-if` before you apply
- Keep names deterministic by using the prefix pattern

## CI and validation
- See [CI and Validation](cicd.md) for the workflow that builds `.bicep` files on PRs and pushes

## Naming and inputs
- Prefix format: `<ORG_NAME>-<APP_NAME>-<ENV>`
- Some services collapse names (storage, ACR); adjust inputs if a name is not available
- Pass secrets securely at deploy time or via Key Vault references

## Contributing
- Open an issue for requests or bugs
- Use small PRs with clear descriptions
- Include a parameter example and validation notes for new modules
