# CI and Validation

Use the included workflow to validate Bicep on pull requests and pushes.

## At a glance
- Workflow path: .github/workflows/validate.yml
- Action: az bicep build for every .bicep file

## Prerequisites
- [ ] Azure CLI available in the runner
- [ ] .bicep files present in the repo

## Steps
1) Open a pull request or push to main.  
2) The workflow builds each .bicep file.  
3) Fix any syntax errors before merging.

## Extend
- [ ] Add what-if jobs for main parameter files
- [ ] Add a gated deploy to a test subscription after PR approval

## Troubleshooting
- Build fails on missing Azure CLI: install CLI or Bicep standalone in the job
- Unused modules flagged: narrow file globs to paths in use
