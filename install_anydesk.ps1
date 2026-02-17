$anydeskPath = "C:\Program Files (x86)\AnyDesk\AnyDesk.exe"

Write-Output "Verificando instalação do AnyDesk..."

if (Test-Path $anydeskPath) {
    Write-Output "AnyDesk já está instalado."
    exit 0
}

Write-Output "AnyDesk não encontrado. Baixando instalador..."

$installerUrl = "https://download.anydesk.com/AnyDesk.exe"
$tempInstaller = "$env:TEMP\AnyDesk_setup.exe"

try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $wc = New-Object System.Net.WebClient
    $wc.DownloadFile($installerUrl, $tempInstaller)
} catch {
    Write-Output "Falha ao baixar AnyDesk: $_"
    exit 1
}

if (-not (Test-Path $tempInstaller)) {
    Write-Output "Arquivo não encontrado após download."
    exit 1
}

Write-Output "Abrindo instalador do AnyDesk..."

Start-Process $tempInstaller

Write-Output "Instalador iniciado."
exit 0
