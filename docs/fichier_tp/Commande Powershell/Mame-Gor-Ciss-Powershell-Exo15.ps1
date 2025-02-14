# Script d'administration du serveur DNS
# ------------------------------------------------------
#Vérifier si on  peux accéder au serveur à distance 
Test-WSMan -ComputerName 192.168.140.132

# 1. Récupérer les serveurs DNS de l’ordinateur
function Get-DNSServers {
    Write-Host "Serveurs DNS actuels :"
    Get-DnsClientServerAddress | ForEach-Object {
        $_.ServerAddresses
    }
}

# 1.2 Tester si les serveurs sont démarrés
function Test-DNSServer {
    param (
        [string]$dnsServer
    )
    try {
        Test-Connection -ComputerName $dnsServer -Count 1 -ErrorAction Stop
        Write-Host "$dnsServer est en ligne."
    } catch {
        Write-Host "$dnsServer est hors ligne."
    }
}

# 2. Changer le serveur DNS 
function Change-DNSServer {
    param (
        [string]$interfaceAlias,
        [string]$newDNSServer
    )
    Set-DnsClientServerAddress -InterfaceAlias $interfaceAlias -ServerAddresses $newDNSServer
    Write-Host "Le serveur DNS a été changé pour $newDNSServer sur l'interface $interfaceAlias."
}

# 4. Créer un enregistrement DNS sur le serveur distant
function Create-DNSRecordRemote {
    param (
        [PSSession]$session,
        [string]$recordName,
        [string]$recordType,
        [string]$recordData
    )

    Invoke-Command -Session $session -ScriptBlock {
        param ($recordName, $recordType, $recordData)

        if ($recordType -eq "A") {
            Add-DnsServerResourceRecordA -Name $recordName -ZoneName "contoso.com" -IPv4Address $recordData
            Write-Host "Enregistrement A créé pour $recordName -> $recordData"
        } else {
            Write-Host "Type d'enregistrement DNS non pris en charge."
        }
    } -ArgumentList $recordName, $recordType, $recordData
}

# 7. Visualiser les erreurs DNS sur le serveur distant
function Get-DNSErrorsRemote {
    param (
        [PSSession]$session
    )

    Invoke-Command -Session $session -ScriptBlock {
        Get-EventLog -LogName "DNS Server" -Newest 10 | Format-Table -AutoSize
    }
}

# Menu principal
function Show-Menu {
    cls

    Write-Host "1. Récupérer les serveurs DNS"
    Write-Host "2. Tester un serveur DNS"
    Write-Host "3. Changer le serveur DNS"
    Write-Host "4. Créer un enregistrement DNS"
    Write-Host "7. Visualiser les erreurs DNS"
    Write-Host "8. Quitter"
    Write-Host ""
    $choice = Read-Host "Sélectionnez une option"

    switch ($choice) {
        1 {
            Get-DNSServers
        }
        2 {
            $dnsServer = Read-Host "Entrez le nom ou l'adresse IP du serveur DNS"
            Test-DNSServer -dnsServer $dnsServer
        }
        3 {
            $interfaceAlias = Read-Host "Entrez le nom de l'interface réseau"
            $newDNSServer = Read-Host "Entrez la nouvelle adresse IP du serveur DNS"
            Change-DNSServer -interfaceAlias $interfaceAlias -newDNSServer $newDNSServer
        }
        4 {
            $recordName = Read-Host "Entrez le nom de l'enregistrement"
            $recordType = Read-Host "Entrez le type d'enregistrement (A, CNAME)"
            $recordData = Read-Host "Entrez les données de l'enregistrement (IP ou Alias)"
            Create-DNSRecord -recordName $recordName -recordType $recordType -recordData $recordData
        }
        5 {
            $input = Read-Host "Entrez le nom ou l'adresse IP"
            $type = Read-Host "Type de test (NameToIP ou IPToName)"
            Test-DNSRecord -input $input -type $type
        }
        6 {
            $recordName = Read-Host "Entrez le nom de l'enregistrement à supprimer"
            $recordType = Read-Host "Entrez le type d'enregistrement (A, CNAME)"
            Remove-DNSRecord -recordName $recordName -recordType $recordType
        }
        7 {
            Get-DNSErrors
        }
        8 {
            exit
        }
        default {
            Write-Host "Option non valide."
        }
    }

    Pause
}

# Boucle principale
while ($true) {
    Show-Menu
}
