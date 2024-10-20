$updateSession = New-Object -ComObject Microsoft.Update.Session
$updateSearcher = $updateSession.CreateUpdateSearcher()
$updates = $updateSearcher.Search("IsInstalled=0")
if ($updates.Updates.Count -eq 0) {
    Write-Output "No hay actualizaciones disponibles."
    exit
}
$updateDownloader = $updateSession.CreateUpdateDownloader()
$updateDownloader.Updates = $updates.Updates
$updateDownloader.Download()
$updateInstaller = New-Object -ComObject Microsoft.Update.Installer
$updateInstaller.Updates = $updates.Updates
$installResult = $updateInstaller.Install()
if ($installResult.ResultCode -eq 2) {
    Write-Output "Actualizaciones instaladas."
} else {
    Write-Output "Error. Código de resultado: $($installResult.ResultCode)"
}
