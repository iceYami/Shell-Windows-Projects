$source = "C:\..."
$dest = "D:\..."
$lastBackup = Get-Content "D:\...\lastBackup.txt"
$files = Get-ChildItem -Path $source -Recurse | Where-Object {($_.LastWriteTime -gt $lastBackup) -and (-not $_.PSIsContainer)}
foreach ($file in $files) {
    $destFile = $file.FullName -replace [regex]::Escape($source), $dest
    $destPath = Split-Path $destFile -Parent
    if (-not (Test-Path $destPath)) {
        New-Item -Path $destPath -ItemType Directory -Force
    }
    Copy-Item $file.FullName -Destination $destFile -Force
}
(Get-Date).ToString() | Out-File "D:\...\lastBackup.txt"
