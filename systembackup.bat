$backupFolder = "C:\Backup"
$backupDate = Get-Date -Format "yyyyMMdd"
$backupPath = "$backupFolder\SystemBackup_$backupDate"
if (!(Test-Path -Path $backupFolder)) {
    New-Item -Path $backupFolder -ItemType Directory
}
New-Item -Path $backupPath -ItemType Directory
wbadmin start backup -backupTarget:$backupPath -include:C: -allCritical -quiet
if ($LASTEXITCODE -eq 0) {
    Write-Output "Respaldo del sistema completado exitosamente en: $backupPath"
} else {
    Write-Output "Error al realizar el respaldo del sistema"
}
