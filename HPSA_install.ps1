Expand-Archive .\HPSA9x.zip -DestinationPath .
$dependencies = @(
    @{ Name = "Microsoft.NET.Native.Framework.1.3"; Path = ".\HPSA9x\Dependencies\x64\Microsoft.NET.Native.Framework.1.3.appx" },
    @{ Name = "Microsoft.NET.Native.Runtime.1.4";    Path = ".\HPSA9x\Dependencies\x64\Microsoft.NET.Native.Runtime.1.4.appx" },
    @{ Name = "Microsoft.VCLibs.x64.14.00";          Path = ".\HPSA9x\Dependencies\x64\Microsoft.VCLibs.x64.14.00.appx" }
)

foreach ($dep in $dependencies) {
    $found = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -eq $dep.Name }
    if (-not $found) {
        Add-AppxProvisionedPackage -Online -PackagePath $dep.Path -SkipLicense
    }
}
Add-AppxProvisionedPackage -Online -PackagePath ".\HPSA9x\4d698007d9d842d5b1e6fd1ead2c1cd4.appxbundle" -SkipLicense