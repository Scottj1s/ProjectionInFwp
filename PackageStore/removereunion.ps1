$allApps = Get-AppxPackage

$appsToRemove = @()
foreach($app in $allApps)
{
    foreach($dep in $app.Dependencies)
    {
        if($dep.Name.Contains("ProjectReunion"))
        {
 
            $appsToRemove += $app
        }
    }
}

foreach($app in $appsToRemove)
{
    Write-Host "To Remove: $($app.Name)"
    Remove-AppxPackage $app
}

foreach($app in (Get-AppxPackage -Name *ProjectReunion*))
{
   Write-Host "To Remove: $($app.Name)"
   Remove-AppxPackage $app
}