# Azure Deployment
## Prerequisites
- Azure subscription
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

## Create Resource Group
Execute `az group create` to create resource group,
```
az group create --location eastus --name rg-alpha
```

## App Service 
Execute `az deployment group create` to deploy the App Service (only),
```
az deployment group create -g rg-alpha -f ./arm/app-service-only.json
```
