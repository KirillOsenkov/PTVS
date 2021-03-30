# DEVOPS_TOKEN is not secret so that it works on other branches. Since Devops pipeline is only accessible from 
# Microsoft, doesn't need to be secret in pipeline
Write-Host "Writing .npmrc with token $Env:MAPPED_AZURE_DEVOPS_TOKEN from environment"
Set-Content -Path ".npmrc" -Value "registry=https://devdiv.pkgs.visualstudio.com/_packaging/Pylance/npm/registry/"
Add-Content -Path ".npmrc" -Value "always-auth=true"
Add-Content -Path ".npmrc" -Value "; begin auth token"
Add-Content -Path ".npmrc" -Value "//devdiv.pkgs.visualstudio.com/_packaging/Pylance/npm/registry/:username=devdiv"
Add-Content -Path ".npmrc" -Value "//devdiv.pkgs.visualstudio.com/_packaging/Pylance/npm/registry/:_password=$Env:MAPPED_AZURE_DEVOPS_TOKEN"
Add-Content -Path ".npmrc" -Value "//devdiv.pkgs.visualstudio.com/_packaging/Pylance/npm/registry/:email=npm requires email to be set but doesn't use the value"
Add-Content -Path ".npmrc" -Value "//devdiv.pkgs.visualstudio.com/_packaging/Pylance/npm/:username=devdiv"
Add-Content -Path ".npmrc" -Value "//devdiv.pkgs.visualstudio.com/_packaging/Pylance/npm/:_password=$Env:MAPPED_AZURE_DEVOPS_TOKEN"
Add-Content -Path ".npmrc" -Value "//devdiv.pkgs.visualstudio.com/_packaging/Pylance/npm/:email=npm requires email to be set but doesn't use the value"
Add-Content -Path ".npmrc" -Value "; end auth token"