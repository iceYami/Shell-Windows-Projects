Get-ChildItem -Path "C:\..." -Recurse | Where-Object { $_.PSIsContainer -eq $false } | Sort-Object -Property Length -Descending | Select-Object -First 10
function Get-LargestFiles {
    param (
        [string]$Path,
        [int]$Count = 10
    )
    Get-ChildItem -Path $Path -Recurse | 
    Where-Object { $_.PSIsContainer -eq $false } | 
    Sort-Object -Property Length -Descending | 
    Select-Object -First $Count
}
Get-LargestFiles -Path "C:\Ruta\De\Tu\Carpeta" -Count 10
