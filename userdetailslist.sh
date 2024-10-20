$localUsers = Get-WmiObject Win32_UserAccount | Where-Object { $_.LocalAccount -eq $true }
$domainUsers = @()
if ((gwmi win32_computersystem).partofdomain -eq $true) {
    $domain = (Get-WmiObject win32_computersystem).Domain
    $domainUsers = Get-ADUser -Filter * -Server $domain | Select-Object Name, Description, SamAccountName
}
Write-Output "Usuarios locales:"
foreach ($localUser in $localUsers) {
    Write-Output "Nombre: $($localUser.Name)"
    Write-Output "Descripción: $($localUser.Description)"
    Write-Output "Tipo de cuenta: $($localUser.AccountType)"
    Write-Output "-----"
}
if ($domainUsers) {
    Write-Output "Usuarios del dominio ($domain):"
    foreach ($domainUser in $domainUsers) {
        Write-Output "Nombre: $($domainUser.Name)"
        Write-Output "Descripción: $($domainUser.Description)"
        Write-Output "Nombre de cuenta: $($domainUser.SamAccountName)"
        Write-Output "-----"
    }
} else {
    Write-Output "No hay usuarios del dominio."
}
