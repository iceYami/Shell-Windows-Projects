systeminfo
function Get-SystemInfo {
    $osInfo = Get-WmiObject -Class Win32_OperatingSystem
    $sysInfo = @{
        "OS Name" = $osInfo.Caption
        "Version" = $osInfo.Version
        "Manufacturer" = (Get-WmiObject -Class Win32_ComputerSystem).Manufacturer
        "Model" = (Get-WmiObject -Class Win32_ComputerSystem).Model
        "System Type" = (Get-WmiObject -Class Win32_ComputerSystem).SystemType
        "Processor(s)" = (Get-WmiObject -Class Win32_Processor).Name
        "Total Physical Memory (GB)" = "{0:N2}" -f ((Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1GB)
        "Available Physical Memory (GB)" = "{0:N2}" -f ((Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory / 1GB)
        "Total Virtual Memory (GB)" = "{0:N2}" -f ((Get-WmiObject -Class Win32_OperatingSystem).TotalVirtualMemorySize / 1GB)
        "Available Virtual Memory (GB)" = "{0:N2}" -f ((Get-WmiObject -Class Win32_OperatingSystem).FreeVirtualMemory / 1GB)
    }
    $sysInfo
}
Get-SystemInfo
