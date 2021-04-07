# Azure Deployment
## Prerequisites
- Azure subscription
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

## Create Resource Group
Execute `az group create` to create resource group,
```
az group create --location eastus --name my-resource-group
```

## App Service 
Execute `az deployment group create` to deploy the App Service (only),
```
az deployment group create -g my-resource-group -f ./app-service-only.json
```
