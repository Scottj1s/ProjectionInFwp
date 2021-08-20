pushd (Split-Path $MyInvocation.MyCommand.Path -Parent)

.\removereunion.ps1

# Build and register PR FWPs
cd .\win10-x64
MakeAppx pack /p Microsoft.ProjectReunion.0.8.msix /d Microsoft.ProjectReunion.0.8 /o
SignTool sign /fd SHA256 /a /f ..\MyKey.pfx /p password Microsoft.ProjectReunion.0.8.msix
Add-AppxPackage -Path Microsoft.ProjectReunion.0.8.msix
cd ..\win10-x86
MakeAppx pack /p Microsoft.ProjectReunion.0.8.msix /d Microsoft.ProjectReunion.0.8 /o
SignTool sign /fd SHA256 /a /f ..\MyKey.pfx /p password Microsoft.ProjectReunion.0.8.msix
Add-AppxPackage -Path Microsoft.ProjectReunion.0.8.msix

popd