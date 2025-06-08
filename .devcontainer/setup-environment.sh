#!/bin/bash

# Codespaces Environment Setup Script
# This script helps configure environment variables from GitHub secrets/variables

echo "🚀 Setting up LlammaClient Codespaces environment..."

# Check for required secrets
check_secret() {
    local secret_name=$1
    local default_value=$2
    
    if [ -z "${!secret_name}" ]; then
        echo "⚠️  Secret '$secret_name' not found, using default: $default_value"
        export $secret_name="$default_value"
    else
        echo "✅ Secret '$secret_name' configured from repository secrets"
    fi
}

# Required secrets for development
check_secret "MSSQL_SA_PASSWORD" "P@ssw0rd!"
check_secret "ASPNETCORE_ENVIRONMENT" "Development"
check_secret "DOTNET_DASHBOARD_UNSECURED_ALLOW_ANONYMOUS" "true"

# Optional secrets for cloud deployment
if [ -n "$AZURE_CLIENT_ID" ]; then
    echo "✅ Azure credentials configured"
fi

if [ -n "$GOOGLE_CLOUD_PROJECT_ID" ]; then
    echo "✅ Google Cloud credentials configured"
fi

echo "🎯 Environment setup complete!"
echo "💡 To add secrets: Go to Repository Settings → Secrets and variables → Actions"
