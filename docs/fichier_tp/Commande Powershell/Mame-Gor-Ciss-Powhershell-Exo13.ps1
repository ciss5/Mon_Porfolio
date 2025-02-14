# Informations des disques
$disks = Get-WmiObject -Class Win32_LogicalDisk
$totalFreeSpace = 0
$totalSize = 0
foreach ($disk in $disks) {
    # Calcul de l'espace libre et de l'espace total en Go
    $freeSpaceGB = ($disk.FreeSpace / 1GB)
    $totalSizeGB = ($disk.Size / 1GB)
    
    $totalSize += $totalSizeGB
    
    # Affichage des informations du disque
    Write-Host "Disque: $($disk.DeviceID)"
    Write-Host "Espace libre: $([math]::Round($freeSpaceGB, 2)) Go"
    Write-Host "Espace total: $([math]::Round($totalSizeGB, 2)) Go"
    Write-Host ""
}

# Affichage des espaces totaux
Write-Host "Espace total des disques: $([math]::Round($totalSize, 2)) Go"
