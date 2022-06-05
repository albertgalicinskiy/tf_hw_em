#!/bin/bash
# Description: Add Key Value pair to Azure App configuration

appConfigName="$1"
newKey="$2"
newValue="$3"

# Login to Azure
az login
echo

# Create a new key-value 
az appconfig kv set --name $appConfigName --key $newKey --value $newValue --yes
echo

# List current key-values
az appconfig kv list --name $appConfigName
